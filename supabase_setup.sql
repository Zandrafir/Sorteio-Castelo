-- ============================================================
--  CASTELO • SORTEIO MENSAL — CONFIGURAÇÃO DO BANCO DE DADOS
--  Cole TODO este conteúdo no SQL Editor do Supabase e rode.
-- ============================================================

-- 1) TABELA DE PARTICIPANTES -------------------------------------------------
create table if not exists participantes (
  id            uuid primary key default gen_random_uuid(),
  nome          text not null,
  contato       text not null,                 -- whatsapp / instagram
  loja          text not null,                 -- AlphaCo | Biostevi | Growth
  comprovante   text not null,                 -- caminho do arquivo no storage
  status        text not null default 'pendente', -- pendente | aprovado | rejeitado
  ciclo         text not null,                 -- ex: 2026-06 (mês do sorteio)
  criado_em     timestamptz not null default now()
);

-- 2) TABELA DE GANHADORES (histórico público) -------------------------------
create table if not exists ganhadores (
  id             uuid primary key default gen_random_uuid(),
  participante_id uuid references participantes(id),
  nome           text not null,
  loja           text not null,
  ciclo          text not null,
  valor_credito  numeric not null default 0,
  resgatado      boolean not null default false,
  sorteado_em    timestamptz not null default now()
);

-- 3) SEGURANÇA (Row Level Security) -----------------------------------------
alter table participantes enable row level security;
alter table ganhadores   enable row level security;

-- Qualquer visitante pode SE INSCREVER (insert) e ver ganhadores
create policy "inscricao_publica"
  on participantes for insert
  to anon with check (true);

create policy "ganhadores_publicos"
  on ganhadores for select
  to anon using (true);

-- Apenas usuários logados (o Castelo) leem/editam participantes e gravam ganhadores
create policy "admin_le_participantes"
  on participantes for select to authenticated using (true);
create policy "admin_edita_participantes"
  on participantes for update to authenticated using (true);
create policy "admin_grava_ganhadores"
  on ganhadores for insert to authenticated with check (true);
create policy "admin_edita_ganhadores"
  on ganhadores for update to authenticated using (true);

-- 4) STORAGE para os comprovantes ------------------------------------------
insert into storage.buckets (id, name, public)
values ('comprovantes', 'comprovantes', true)
on conflict (id) do nothing;

create policy "upload_comprovante_publico"
  on storage.objects for insert
  to anon with check (bucket_id = 'comprovantes');

create policy "ver_comprovante_publico"
  on storage.objects for select
  to public using (bucket_id = 'comprovantes');

-- ============================================================
--  FIM. Tudo pronto. Volte ao site e siga o passo do login.
-- ============================================================

# 🏰 CASTELO · Guia de configuração (passo a passo)

Você **não vai programar nada**. São 3 etapas, uns 10–15 minutos no total.
Faça na ordem. Ao final, o site fica 100% funcional.

---

## ETAPA 1 — Criar o banco de dados (Supabase)

1. Acesse **https://supabase.com** e clique em **Start your project** (entre com Google ou GitHub).
2. Clique em **New Project**.
   - **Name:** `castelo-sorteio` (ou o que quiser)
   - **Database Password:** crie uma senha forte e **anote num lugar seguro**.
   - **Region:** escolha **South America (São Paulo)**.
   - Clique em **Create new project** e espere ~2 minutos (ele monta o banco).

---

## ETAPA 2 — Montar as tabelas (colar o SQL)

1. No menu lateral esquerdo, clique no ícone **SQL Editor** (parece `>_`).
2. Clique em **+ New query**.
3. Abra o arquivo **`supabase_setup.sql`** (que veio junto), copie **TODO** o conteúdo e cole na caixa.
4. Clique em **Run** (canto inferior direito). Deve aparecer **"Success. No rows returned"** — está certo.

> Isso cria as tabelas de participantes, ganhadores e a pasta dos comprovantes automaticamente.

---

## ETAPA 3 — Criar o login do Castelo

1. No menu lateral, clique em **Authentication** → aba **Users**.
2. Clique em **Add user** → **Create new user**.
3. Digite o **e-mail** e a **senha** que o Castelo vai usar pra entrar no painel admin.
   - ⚠️ Desmarque "Auto Confirm User"? **Não** — deixe marcado/confirmado pra ele já conseguir entrar.
4. Clique em **Create user**. Pronto, esse é o acesso ao painel.

---

## ETAPA 4 — Pegar as 2 chaves e me mandar (ou colar você mesmo)

1. No menu lateral, clique na **engrenagem** (Project Settings) → **API**.
2. Você vai ver dois valores. Copie os dois:
   - **Project URL** → algo como `https://xxxxx.supabase.co`
   - **anon public** (em "Project API keys") → uma chave longa começando com `eyJ...`
3. **Me mande os dois aqui no chat** que eu já deixo tudo conectado e te devolvo o arquivo final.

> Se preferir colar você mesmo: abra o `index.html` num bloco de notas, e nas duas primeiras linhas marcadas
> (`COLE_AQUI_A_PROJECT_URL` e `COLE_AQUI_A_ANON_PUBLIC_KEY`) substitua pelos valores. Salve.

---

## ETAPA 5 — Publicar no GitHub Pages (o site no ar)

1. Crie um repositório no GitHub (ex: `castelo-sorteio`), **Public**.
2. Suba o arquivo `index.html` (botão **Add file → Upload files**).
3. No repositório: **Settings → Pages → Source: Deploy from a branch → branch `main` / root → Save**.
4. Em ~1 minuto o GitHub te dá o link público (ex: `https://seuusuario.github.io/castelo-sorteio`).
   Esse é o link que você manda pra galera. O painel admin fica no mesmo link, no botão **Admin**.

---

## ✅ Como o Castelo usa no dia a dia

- **Galera:** acessa o link, preenche o formulário e anexa o print do pedido.
- **Castelo:** entra em **Admin** (e-mail/senha da Etapa 3), vê os comprovantes, clica **Aprovar** nos válidos.
- **Sorteio:** no fim do mês, ele põe o valor do crédito e clica **Rodar sorteio** — a roleta escolhe na hora.
- **Ganhador:** aparece automaticamente na página pública "Ganhadores". O Castelo marca como "resgatado" quando pagar/abater o crédito.

---

**Importante (legal):** o site já vem com o texto de regulamento no rodapé deixando claro que é
promoção recreativa, gratuita, com crédito concedido voluntariamente — que é o formato seguro que combinamos.

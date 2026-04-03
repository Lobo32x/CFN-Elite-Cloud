# CFN Elite Tracker com Supabase

Projeto em HTML/CSS/JS com:
- login e cadastro por email/senha
- sincronização entre celular e PC
- armazenamento remoto no Supabase
- painel CFN + TAF + Cyber

## Arquivos
- `index.html`: painel completo
- `schema.sql`: tabela e policies do Supabase

## Como configurar
1. Crie um projeto no Supabase.
2. Vá em **SQL Editor** e execute `schema.sql`.
3. Em **Authentication > Providers**, deixe Email habilitado.
4. Em **Project Settings > API**, copie:
   - `Project URL`
   - `anon public key`
5. Abra `index.html` no navegador.
6. Cole a URL e a anon key no painel de configuração.
7. Crie sua conta e faça login.

## Publicar
Você pode publicar o `index.html` em:
- GitHub Pages
- Netlify
- Vercel
- qualquer hospedagem estática

## Observações
- O projeto usa a `anon key`, que é a chave pública correta para o front-end.
- As regras de RLS garantem que cada usuário veja apenas os próprios dados.
- Se seu projeto do Supabase exigir confirmação de email, confirme antes de fazer login.

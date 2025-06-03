# Vim & Terminal Cheat Sheet

Este guia rápido traz comandos essenciais e avançados para edição no **Vim** e uso do **Terminal** (Bash), organizado por categorias. Use como referência para acelerar seu fluxo de trabalho.

---

## Índice

1. [Vim](#vim)  
   1.1 [Modos do Vim](#modos-do-vim)  
   1.2 [Navegação Básica](#navegação-básica)  
   1.3 [Edição & Inserção](#edição--inserção)  
   1.4 [Navegação Avançada](#navegação-avançada)  
   1.5 [Busca e Substituição](#busca-e-substituição)  
   1.6 [Seleção & Visual Mode](#seleção--visual-mode)  
   1.7 [Buffers, Janelas e Guias (Tabs)](#buffers-janelas-e-guias-tabs)  
   1.8 [Macros & Registros](#macros--registros)  
   1.9 [Configurações & Customizações](#configurações--customizações)  

2. [Terminal (Bash)](#terminal-bash)  
   2.1 [Navegação e Sistema de Arquivos](#navegação-e-sistema-de-arquivos)  
   2.2 [Gerenciamento de Arquivos e Diretórios](#gerenciamento-de-arquivos-e-diretórios)  
   2.3 [Permissões & Proprietários](#permissões--proprietários)  
   2.4 [Processos & Gerenciamento](#processos--gerenciamento)  
   2.5 [Pipelines & Redirecionamento](#pipelines--redirecionamento)  
   2.6 [Manipulação de Texto](#manipulação-de-texto)  
   2.7 [Rede & Transferência de Arquivos](#rede--transferência-de-arquivos)  
   2.8 [Variáveis de Ambiente & Customizações](#variáveis-de-ambiente--customizações)  
   2.9 [Shell Scripting Básico](#shell-scripting-básico)  
   2.10 [Dicas Avançadas](#dicas-avançadas)  

---

# Vim

## Modos do Vim

- **Normal Mode** (modo padrão): navegação e comandos de edição (pressionar `Esc` para entrar aqui).
- **Insert Mode** (modo de inserção): edição de texto (pressionar `i`, `a`, `o` etc.).
- **Visual Mode** (seleção): marcação de texto (pressionar `v`, `V` ou `Ctrl+v`).
- **Command-line Mode** (modo de comando): executar comandos de arquivo e configuração (pressionar `:`).

---

## Navegação Básica

| Comando | Modo | Descrição |
|---------|------|-----------|
| `h` | Normal | Mover cursor uma coluna à esquerda |
| `j` | Normal | Mover cursor uma linha para baixo |
| `k` | Normal | Mover cursor uma linha para cima |
| `l` | Normal | Mover cursor uma coluna à direita |
| `w` | Normal | Ir para o início da próxima palavra |
| `b` | Normal | Ir para o início da palavra anterior |
| `e` | Normal | Ir para o final da palavra atual |
| `0` | Normal | Ir para o início da linha |
| `^` | Normal | Ir para o primeiro caractere não branco da linha |
| `$` | Normal | Ir para o final da linha |
| `gg` | Normal | Ir para a primeira linha do arquivo |
| `G` | Normal | Ir para a última linha do arquivo |
| `:line_number` | Command | Ir para a linha especificada (ex.: `:42`) |
| `Ctrl+u` | Normal | Descer meia tela |
| `Ctrl+d` | Normal | Subir meia tela |
| `Ctrl+f` | Normal | Descer tela inteira |
| `Ctrl+b` | Normal | Subir tela inteira |

---

## Edição & Inserção

| Comando | Modo | Descrição |
|---------|------|-----------|
| `i` | Normal → Insert | Entrar em Insert Mode antes do cursor |
| `I` | Normal → Insert | Entrar em Insert Mode no início da linha |
| `a` | Normal → Insert | Entrar em Insert Mode após o cursor |
| `A` | Normal → Insert | Entrar em Insert Mode no final da linha |
| `o` | Normal → Insert | Inserir nova linha abaixo e entrar em Insert Mode |
| `O` | Normal → Insert | Inserir nova linha acima e entrar em Insert Mode |
| `r<char>` | Normal | Substituir o caractere sob cursor por `<char>` |
| `R` | Normal → Replace Mode | Substituir texto em sequência sem sair do modo |
| `x` | Normal | Excluir caractere sob o cursor |
| `X` | Normal | Excluir caractere antes do cursor |
| `dd` | Normal | Excluir (recortar) a linha inteira |
| `D` | Normal | Excluir do cursor até o fim da linha |
| `yy` | Normal | Copiar (yank) a linha inteira |
| `y{motion}` | Normal | Copiar a área definida pelo movimento (ex.: `yw`, `y$`) |
| `p` | Normal | Colar após o cursor |
| `P` | Normal | Colar antes do cursor |
| `u` | Normal | Desfazer última ação |
| `Ctrl+r` | Normal | Refazer (redo) ação desfeita |
| `.` | Normal | Repetir último comando de edição |

---

## Navegação Avançada

| Comando | Modo | Descrição |
|---------|------|-----------|
| `f<char>` | Normal | Ir para próximo `<char>` na mesma linha (ex.: `fx`) |
| `F<char>` | Normal | Ir para `<char>` à esquerda na mesma linha |
| `t<char>` | Normal | Ir até antes de `<char>` na mesma linha |
| `T<char>` | Normal | Ir até antes de `<char>` à esquerda na mesma linha |
| `;` | Normal | Repetir último `f` ou `t` |
| `,` | Normal | Repetir último `F` ou `T` |
| `w`, `W` | Normal | Próxima palavra (considerando pontuação ou não) |
| `b`, `B` | Normal | Palavra anterior |
| `ge`, `gE` | Normal | Fim da palavra anterior |
| `(`, `)` | Normal | Início/fim de expressão entre parênteses |
| `{`, `}` | Normal | Início/fim de parágrafo |
| `*` | Normal | Buscar palavra sob cursor para frente (`n`/`N` para próximo/anterior) |
| `#` | Normal | Buscar palavra sob cursor para trás |
| `%` | Normal | Ir para parêntese/comando correspondente (`()`, `{}`, `[]`) |
| `H`, `M`, `L` | Normal | Mover para topo, meio ou base da tela |
| `z<CR>` | Normal | Reposicionar tela para cima, com cursor no topo |
| `z.` | Normal | Reposicionar tela, com cursor no meio |
| `z-` | Normal | Reposicionar tela, com cursor no final |
| `` `o` `` | Normal | Ir para a posição exata da marca `o` (linha + coluna) |
| `` `'o'` `` | Normal | Ir para a linha da marca `o` |
| `m{a-z}` | Normal | Definir marca (mark) em cursor (`ma`, `mb`, etc.) |
| `` `{a-z}` `` | Normal | Ir para a posição exata da marca (linha + coluna) |
| `` `'<` / `'>` `` | Normal | Ir para início/fim da última seleção Visual |

---

## Busca e Substituição

| Comando | Modo | Descrição |
|---------|------|-----------|
| `/{pattern}` | Normal | Buscar `pattern` para frente (`n` para próximo, `N` para anterior) |
| `?{pattern}` | Normal | Buscar `pattern` para trás |
| `:{range}s/{orig}/{subst}/[flags]` | Command | Substituir em intervalo (`range` ex.: `:%s/velho/novo/g`) |
| `:%s/palavra1/palavra2/g` | Command | Substituir todas ocorrências no arquivo |
| `:%s/\s\+$//e` | Command | Remover espaços em branco no fim de todas as linhas |
| `:vimgrep /{pattern}/j **/*.{ext}` | Command | Buscar em múltiplos arquivos (usando **wildcards**) |
| `:cfdo %s/antigo/novo/ge | update` | Command | Buscar e substituir em **quickfix list** |

---

## Seleção & Visual Mode

| Comando | Modo | Descrição |
|---------|------|-----------|
| `v` | Normal → Visual (caracteres) | Iniciar seleção por caractere |
| `V` | Normal → Visual (linhas) | Iniciar seleção por linha |
| `Ctrl+v` | Normal → Visual Block | Iniciar seleção em bloco (colunas) |
| `y` | Visual → Normal | Copiar seleção (**yank**) |
| `d` | Visual → Normal | Excluir (cortar) seleção |
| `>` | Visual | Identar seleção à direita |
| `<` | Visual | Recuar seleção à esquerda |
| `~` | Visual | Inverter maiúsculas/minúsculas na seleção |
| `gv` | Normal | Retornar à última seleção Visual |
| `o` | Visual | Alternar entre início e fim da seleção |
| `I` | Visual | Inserir texto em múltiplas linhas (Block Visual) |
| `A` | Visual | Adicionar texto ao final de cada linha selecionada |

---

## Buffers, Janelas e Guias (Tabs)

### Buffers

| Comando | Modo | Descrição |
|---------|------|-----------|
| `:e {arquivo}` ou `:edit {arquivo}` | Command | Abrir/alternar para `arquivo` (no buffer atual) |
| `:bnext` ou `:bn` | Command | Ir para próximo buffer |
| `:bprev` ou `:bp` | Command | Ir para buffer anterior |
| `:b{n}` | Command | Ir para buffer de número `n` (ex.: `:b3`) |
| `:ls` ou `:buffers` | Command | Listar buffers abertos |

### Janelas (Splits)

| Comando | Modo | Descrição |
|---------|------|-----------|
| `:split {arquivo}` ou `:sp {arquivo}` | Command | Abrir arquivo em janela horizontal dividida |
| `:vsplit {arquivo}` ou `:vsp {arquivo}` | Command | Abrir arquivo em janela vertical dividida |
| `Ctrl+w s` | Normal | Dividir janela horizontal |
| `Ctrl+w v` | Normal | Dividir janela vertical |
| `Ctrl+w w` | Normal | Alternar entre splits |
| `Ctrl+w h/j/k/l` | Normal | Mover foco entre splits (esq/baixo/cima/dir) |
| `Ctrl+w =` | Normal | Tornar todos os splits do mesmo tamanho |
| `Ctrl+w _` | Normal | Maximizar a altura da janela atual |
| `Ctrl+w |` | Normal | Maximizar a largura da janela atual |
| `:close` ou `Ctrl+w c` | Normal | Fechar a janela atual |

### Guias (Tabs)

| Comando | Modo | Descrição |
|---------|------|-----------|
| `:tabnew {arquivo}` | Command | Abrir novo tab e carregar `arquivo` |
| `:tabnext` ou `:tabn` | Command | Ir para próximo tab |
| `:tabprev` ou `:tabp` | Command | Ir para tab anterior |
| `:tabclose` ou `:tabc` | Command | Fechar tab atual |
| `:tabmove [n]` | Command | Mover tab atual para posição `n` |

---

## Macros & Registros

| Comando | Modo | Descrição |
|---------|------|-----------|
| `q{a-z}` | Normal | Começar gravação de macro no registro `{a-z}` |
| `q` | Normal | Parar gravação de macro |
| `@{a-z}` | Normal | Executar macro do registro `{a-z}` |
| `@@` | Normal | Reexecutar última macro usada |
| `"ayy` | Normal | Yank (copiar) linha para registro `a` |
| `"ap` | Normal | Colar do registro `a` |
| `"1p`, `"2p`, ... | Normal | Colar conteúdo do registro numerado |
| `:let @a='texto'` | Command | Definir manualmente conteúdo do registro `a` |

---

## Configurações & Customizações

1. **Arquivo de configuração**:  
   - Unix/Linux: `~/.vimrc`  
   - Windows: `%USERPROFILE%\_vimrc`

2. **Exemplos de ajustes comuns**:
   ```vim
   " Ativar números de linha relative
   set number
   set relativenumber

   " Exibir coluna de sinalização
   set signcolumn=yes

   " Destacar sintaxe
   syntax on

   " Definir tamanho de tabulação e autoindent
   set tabstop=4       " largura da tab (espaços)
   set shiftwidth=4    " largura ao usar >>, <<
   set expandtab       " usar espaços em vez de tabs

   " Procurar ignorando case, mas case-sensitive se houver letra maiúscula
   set ignorecase
   set smartcase

   " Ativar mouse (selecionar, redimensionar splits)
   set mouse=a

   " Melhorar desempenho do redraw
   set ttyfast

   " Configurar clipboard para usar sistema operacional
   set clipboard=unnamedplus

   " Atalhos customizados (Exemplo: salvar e sair)
   nnoremap <Leader>w :w<CR>
   nnoremap <Leader>q :q<CR>

   " Plugin managers (exemplos: vim-plug)
   call plug#begin('~/.vim/plugged')
     Plug 'tpope/vim-sensible'
     Plug 'preservim/nerdtree'
     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
   call plug#end()
   ```

3. **Plug-ins úteis**:
   - `nerdtree` (árvore de arquivos)  
   - `fzf.vim` (fuzzy file finder)  
   - `vim-airline` ou `lightline.vim` (barra de status)  
   - `ale` (verificação de sintaxe e lint)  
   - `vim-fugitive` (integração com Git)  

---

# Terminal (Bash)

## Navegação e Sistema de Arquivos

| Comando | Descrição |
|---------|-----------|
| `pwd` | Exibir diretório de trabalho atual (caminho absoluto) |
| `cd [dir]` | Trocar de diretório. `cd ~` ou `cd` → home. `cd -` → último diretório. |
| `ls` | Listar arquivos e pastas no diretório atual. |
| `ls -l` | Listagem longa (permissões, dono, tamanho, data). |
| `ls -a` | Mostrar todos, incluindo arquivos ocultos (`.` e `..`). |
| `ls -lh` | Listagem longa com tamanhos legíveis (KB, MB). |
| `tree` | Mostrar estrutura de diretórios em forma de árvore (se instalado). |
| `find [caminho] -name "padrão"` | Buscar arquivos por nome (ex.: `find . -name "*.sh"`). |

---

## Gerenciamento de Arquivos e Diretórios

| Comando | Descrição |
|---------|-----------|
| `mkdir [dir]` | Criar diretório. |
| `mkdir -p [dir/subdir]` | Criar diretório e subdiretórios intermediários. |
| `rmdir [dir]` | Remover diretório vazio. |
| `rm [arquivo]` | Remover arquivo. |
| `rm -i [arquivo]` | Remover com prompt de confirmação. |
| `rm -r [dir]` | Remover diretório e todo o conteúdo recursivamente. |
| `cp [origem] [destino]` | Copiar arquivo ou diretório (`-r` para recursivo). |
| `mv [origem] [destino]` | Mover/renomear arquivo ou diretório. |
| `touch [arquivo]` | Criar novo arquivo vazio ou atualizar timestamp. |
| `cat [arquivo]` | Exibir conteúdo de um arquivo no terminal. |
| `less [arquivo]` | Paginar arquivo para leitura (navegação com ↑/↓, `q` sai). |
| `head [arquivo]` | Mostrar primeiras 10 linhas. `head -n 20` → primeiras 20 linhas. |
| `tail [arquivo]` | Mostrar últimas 10 linhas. `tail -f [arquivo]` → acompanhar em tempo real. |
| `ln -s [origem] [link]` | Criar link simbólico. |

---

## Permissões & Proprietários

| Comando | Descrição |
|---------|-----------|
| `ls -l` | Exibir permissões, dono e grupo de arquivos. |
| `chmod [opções] mode [arquivo]` | Modificar permissões (ex.: `chmod 755 script.sh`, `chmod u+x script.sh`, `chmod g-w file.txt`). |
| `chown [dono]:[grupo] [arquivo]` | Alterar dono e/ou grupo (ex.: `chown jose:devs projeto/`). |
| `chown -R [dono]:[grupo] [dir]` | Alterar recursivamente dono/grupo em diretório. |
| `umask [valor]` | Definir máscara padrão para criação de arquivos (ex.: `umask 022`). |

---

## Processos & Gerenciamento

| Comando | Descrição |
|---------|-----------|
| `ps` | Listar processos atuais (apenas na sessão). |
| `ps aux` | Listar todos os processos em execução. |
| `top` | Exibir processos em tempo real (atualizar com `q` para sair). |
| `htop` | Versão mais amigável de `top` (se instalado). |
| `kill [PID]` | Enviar sinal `TERM` para processo. |
| `kill -9 [PID]` | Enviar sinal `KILL` (forçado). |
| `pkill [nome_proc]` | Enviar sinal `TERM` para processos pelo nome. |
| `pkill -f [padrão]` | Enviar sinal `TERM` para processos que correspondam a padrão completo de comando. |
| `jobs` | Listar jobs ativos no shell atual (tarefas em background). |
| `fg [%job]` | Trazer job para foreground. |
| `bg [%job]` | Retomar job em background. |
| `&` | Adicionar ao final de um comando para executá-lo em background (ex.: `./script.sh &`). |
| `nohup [comando] &` | Executar comando em background ignorando hangup (útil em logout). |
| `nice -n [prio] [comando]` | Iniciar processo com prioridade ajustada (valor -20 a +19). |
| `renice [prio] -p [PID]` | Alterar prioridade de processo já em execução. |

---

## Pipelines & Redirecionamento

| Comando | Descrição |
|---------|-----------|
| `[comando1] | [comando2]` | Encadeia saída de 1 para entrada de 2 (pipe). |
| `[comando] > [arquivo]` | Redireciona saída padrão para arquivo (sobrescreve). |
| `[comando] >> [arquivo]` | Redireciona saída padrão para arquivo (append). |
| `[comando] 2> [arquivo]` | Redireciona saída de erro (stderr) para arquivo. |
| `[comando] &> [arquivo]` | Redireciona stdout e stderr para arquivo (bash). |
| `[comando] < [arquivo]` | Usa arquivo como entrada padrão para o comando. |
| `[comando] 2>&1` | Redireciona stderr para o mesmo destino que stdout. |
| `tee [arquivo]` | Duplica a saída para tela e para arquivo (ex.: `cmd | tee out.txt`). |

---

## Manipulação de Texto

| Comando | Descrição |
|---------|-----------|
| `grep [opções] PATTERN [arquivos]` | Buscar padrão em arquivos (ex.: `grep -i "erro" log.txt`). |
| `grep -R [padrão] [diretório]` | Buscar recursivamente em diretórios. |
| `awk '{print $1, $3}' [arquivo]` | Extrair colunas ou processar texto por campos. |
| `sed [opções] 's/VELHO/novo/g' [arquivo]` | Substituir texto em fluxo (stream). |
| `cut -d [delim] -f [campos] [arquivo]` | Extrair colunas de texto delimitado (ex.: CSV). |
| `sort [opções] [arquivo]` | Ordenar linhas (ex.: `sort -n` para numérico). |
| `uniq [opções]` | Remover linhas duplicadas adjacentes (usado com `sort`). |
| `wc [opções] [arquivo]` | Contar linhas (`-l`), palavras (`-w`) e bytes/char (`-c`). |
| `head [arquivo]` | Mostrar primeiras linhas. |
| `tail [arquivo]` | Mostrar últimas linhas. |
| `tr [origem] [destino]` | Traduzir ou deletar caracteres (ex.: `tr '[:lower:]' '[:upper:]'`). |
| `sed -n '5,10p' [arquivo]` | Mostrar linhas 5 a 10 de um arquivo. |
| `fmt [arquivo]` | Reformata texto preenchendo linhas (útil para parágrafos). |

---

## Rede & Transferência de Arquivos

| Comando | Descrição |
|---------|-----------|
| `ping [host]` | Enviar pacotes ICMP para testar conectividade. |
| `curl [opções] [URL]` | Fazer requisição HTTP/HTTPS (versátil). |
| `wget [URL]` | Baixar arquivos de URLs (não interativo). |
| `ssh [usuário@]host` | Conectar-se a host remoto via SSH. |
| `scp [origem] [destino]` | Copiar arquivos via SSH (ex.: `scp file.txt user@host:/destino`). |
| `sftp [usuário@]host` | Iniciar sessão SFTP interativa. |
| `rsync [opções] origem destino` | Sincronizar arquivos/diretórios (local ou remoto). |
| `netstat -tulpn` | Listar conexões de rede ativas e portas em escuta (Linux). |
| `ss -tulpn` | Substituto moderno para `netstat` (exibe sockets TCP/UDP). |
| `dig [domínio]` | Resolver informações de DNS (ex.: `dig openai.com`). |
| `nslookup [domínio]` | Outra ferramenta de consulta DNS. |

---

## Variáveis de Ambiente & Customizações

| Comando | Descrição |
|---------|-----------|
| `echo $HOME`, `echo $PATH`, `echo $SHELL` | Exibir valor de variável de ambiente. |
| `export VAR=value` | Definir variável de ambiente para sessão atual. |
| `export PATH=$PATH:/novo/caminho` | Adicionar diretório ao `PATH`. |
| `env` | Listar todas as variáveis de ambiente atuais. |
| `printenv VAR` | Exibir valor específico de uma variável. |
| `unset VAR` | Remover variável de ambiente. |
| **Arquivos de inicialização**:  
  - `~/.bashrc` (Configurações de shell interativo não-login)  
  - `~/.bash_profile` ou `~/.profile` (Shell de login)  
  - `/etc/bash.bashrc`, `/etc/profile` (configurações globais) |

**Exemplos em `.bashrc`:**
```bash
# Alias comuns
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'
alias gs='git status'
alias gd='git diff'
alias ..='cd ..'

# Função para busca recursiva personalizada
fgrep() {
  grep -R --color=auto "$1" .
}

# Prompt customizado com Git branch
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}
export PS1="\u@\h:\w\[\e[32m\]\$(parse_git_branch)\[\e[0m\]\$ "
```

---

## Shell Scripting Básico

```bash
#!/usr/bin/env bash
# Exemplo: backup-script.sh

# 1. Variáveis e parâmetros
DIR_TO_BACKUP="$1"                  # primeiro parâmetro ao chamar script
BACKUP_DIR="$HOME/backups"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')

# 2. Verificar existência de diretório
if [[ ! -d "$DIR_TO_BACKUP" ]]; then
  echo "Diretório $DIR_TO_BACKUP não existe."
  exit 1
fi

# 3. Criar diretório de backup se não existir
mkdir -p "$BACKUP_DIR"

# 4. Executar tar e redirecionar saída/erros
tar -czf "$BACKUP_DIR/$(basename "$DIR_TO_BACKUP")_$DATE.tar.gz" "$DIR_TO_BACKUP" \
  2> "$BACKUP_DIR/errors_$DATE.log"

if [[ $? -eq 0 ]]; then
  echo "Backup de $DIR_TO_BACKUP concluído com sucesso."
else
  echo "Ocorreu um erro durante o backup. Veja $BACKUP_DIR/errors_$DATE.log"
  exit 1
fi
```

### Estrutura de Controle

```bash
# Estruturas condicionais
if [[ condição ]]; then
  comando1
  comando2
elif [[ outra_condição ]]; then
  comando3
else
  comando4
fi

# Laços de repetição
# while
contador=1
while [[ $contador -le 5 ]]; do
  echo "Iteração $contador"
  ((contador++))
done

# for (intervalo)
for i in {1..5}; do
  echo "Número $i"
done

# for (lista)
for arquivo in *.txt; do
  echo "Arquivo: $arquivo"
done

# Função
minha_funcao() {
  local param="$1"
  echo "Parâmetro recebido: $param"
}
# Chamada: minha_funcao "Hello"
```

---

## Dicas Avançadas

- **Histórico de Comandos**  
  - `history` → listar últimos comandos.  
  - `!n` → executar comando número `n` (ex.: `!42`).  
  - `!!` → repetir último comando.  
  - `!grep` → repetir último comando que começa com “grep”.  
  - `Ctrl+r` → pesquisa reversa incremental no histórico.  

- **Atalhos de Teclado (Bash)**  
  - `Ctrl+a` → ir para início da linha.  
  - `Ctrl+e` → ir para final da linha.  
  - `Ctrl+k` → cortar texto da posição do cursor até o fim da linha.  
  - `Ctrl+u` → cortar texto da posição do cursor até o início da linha.  
  - `Ctrl+w` → cortar palavra anterior.  
  - `Alt+.` → inserir último argumento do comando anterior.  
  - `Ctrl+l` → limpar tela (mesmo que `clear`).  

- **Jobs e Suspensão**  
  - Pressionar `Ctrl+z` → suspender processo em foreground, retorna ao shell.  
  - `jobs` → listar processos suspensos.  
  - `fg %n` → trazer job número `n` para foreground.  
  - `bg %n` → retomar job número `n` em background.  

- **SSH & Túnel SSH**  
  - `ssh-keygen -t rsa -b 4096 -C "seu_email@example.com"` → gerar par de chaves SSH.  
  - `ssh -i ~/.ssh/id_rsa usuario@host` → conectar usando chave específica.  
  - `ssh -L [porta_local]:[destino]:[porta_destino] usuario@host` → criar túnel SSH local.  

- **Gerenciamento de Pacotes (exemplos Debian/Ubuntu)**  
  - `sudo apt update` → atualizar lista de pacotes.  
  - `sudo apt upgrade` → atualizar pacotes instalados.  
  - `sudo apt install pacote` → instalar pacote.  
  - `sudo apt remove pacote` → remover pacote.  
  - `sudo apt autoremove` → remover dependências obsoletas.  

- **Multiplexador de Terminal**  
  - **tmux**  
    - `tmux` → iniciar sessão tmux.  
    - `tmux new -s nome_sessão` → iniciar com nome.  
    - `Ctrl+b c` → criar nova janela.  
    - `Ctrl+b n/p` → navegar entre janelas.  
    - `Ctrl+b d` → detach (desanexar) sessão.  
    - `tmux attach -t nome_sessão` → reconectar a uma sessão.  
  - **screen** (alternativa ao tmux)  
    - `screen` → iniciar.  
    - `Ctrl+a c` → criar nova janela.  
    - `Ctrl+a n/p` → navegar.  
    - `Ctrl+a d` → detach.  
    - `screen -r` → reconectar.  

- **Aliases Dinâmicos**  
  ```bash
  # Exemplo: mudar prompt conforme status do Git
  parse_git_branch() {
    git branch 2>/dev/null | sed -n '/\* /s///p'
  }
  export PS1="\u@\h:\w\[\e[33m\]\$(parse_git_branch)\[\e[0m\]\$ "
  ```

- **Substituição de Comando**  
  - `echo "Hoje é $(date +%F)"` → insere saída de `date`.  
  - `` ls *.txt | xargs wc -l `` → conta linhas de todos `.txt`.  

---

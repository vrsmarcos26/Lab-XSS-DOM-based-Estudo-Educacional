<div align="center">
  <h1>
    Laboratório de XSS Baseado em DOM (CTF Edition) 🧪
  </h1>
</div>

<p align="center">
  <img alt="Linguagem Principal" src="https://img.shields.io/github/languages/top/vrsmarcos26/Lab-XSS-DOM-based-Estudo-Educacional?style=for-the-badge&color=F7DF1E">
  <img alt="Licença" src="https://img.shields.io/github/license/vrsmarcos26/Lab-XSS-DOM-based-Estudo-Educacional?style=for-the-badge&color=blue">
</p>

<p align="center">
  Um painel de Inteligência de Ameaças (W-SIEM Security Events) intencionalmente vulnerável, focado em explorações puramente executadas do lado do cliente através da manipulação do Document Object Model (DOM)[].
</p>

<p align="center">
  <a href="#-aviso-importante">Aviso</a> •
  <a href="#-objetivos-de-aprendizagem">Objetivos</a> •
  <a href="#-tecnologias-utilizadas">Tecnologias</a> •
  <a href="#-como-acessar-o-laboratório">Como Acessar</a> •
  <a href="#-jornada-de-exploração-ctf">Exploração (CTF)</a> •
  <a href="#-créditos">Créditos</a>
</p>

---

### ⚠️ Aviso Importante

> **Este projeto é intencionalmente vulnerável.** Ele foi criado para fins estritamente educacionais e demonstração de falhas web. **NÃO REUTILIZE ESTE CÓDIGO EM PROJETOS REAIS OU SERVIDORES DE PRODUÇÃO.**

---

### 🎯 Objetivos de Aprendizagem

Este laboratório isola as vulnerabilidades que ocorrem no navegador do usuário, dispensando falhas de processamento no back-end. Você aprenderá:

- A mecânica fundamental do **DOM-Based XSS**, injetando código interpretado dinamicamente através do Client-Side JavaScript[].
- Técnicas de bypass de filtros fracos (Sanitização incompleta) no uso crítico da propriedade `.innerHTML`[].
- Manipulação de estado e **Escalonamento de Privilégios local**, modificando variáveis de controle através do temido `eval()`[].
- Técnicas de exfiltração silenciosa atacando o **LocalStorage** para o sequestro de Tokens e API Keys corporativas[].

---

### 🛠️ Tecnologias Utilizadas

Este ambiente foi estruturado utilizando:

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5"></a>
  <a href="#"><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript"></a>
  <a href="#"><img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind"></a>
  <a href="https://www.docker.com/"><img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker"></a>
</p>

---

### ⚙️ Como Acessar o Laboratório

Este laboratório possui duas formas de execução:

#### **Opção 1: Simulador Web (Estudo Básico)**
Uma versão simplificada hospedada no GitHub Pages, focada na detecção de strings simples. 
🔗 **[Acesse o simulador aqui](https://vrsmarcos26.github.io/Lab-XSS-DOM-based-Estudo-Educacional/simulador/)**

#### **Opção 2: Contêiner Nginx (CTF Completo - Via Docker)**
A experiência avançada, contendo a injeção de tokens, filtros customizados e interações em tempo real com a engine JavaScript do navegador.

1. Clone o Repositório:
```bash
git clone https://vrsmarcos26.github.io/Lab-XSS-DOM-based-Estudo-Educacional/simulador/
cd Lab-XSS-DOM-based-Estudo-Educacional
```

2. Construa e suba o ambiente através do Docker
```bash
sudo docker-compose up --build -d
```

3. Acesse a aplicação no seu navegador: http://localhost:8000

---

### 🎬 Jornada de Exploração (CTF)

A barra de busca deste painel de segurança modifica ativamente o DOM da página. Para concluir o CTF, você precisará provar que tem domínio total sobre o estado do navegador e capturar três flags distintas:

#### 🚩 Nível 1: Evasão de Filtro (DOM Mutation)
O desenvolvedor implementou uma Regex de sanitização no JavaScript que remove agressivamente qualquer tag `<script>`. Seu objetivo é conseguir acionar a função base do navegador passando o valor `1` como alerta (ex: `alert(1)`), utilizando recursos alternativos do HTML5 para escapar da filtragem.

#### 🚩 Nível 2: Escalonamento de Privilégio (Manipulação de Estado)
O sistema esconde um painel global de "Debug Administrativo" que só é renderizado se uma variável interna restrita do JavaScript (`isAdmin`) assumir valor verdadeiro. Existe um ponto cego no código original que processa silenciosamente as buscas. Altere a execução lógica do código fonte da página e force o sistema a revelar a área corporativa para obter a segunda flag.

#### 🚩 Nível 3: Roubo de Integrações (API Stealing)
Um alerta genérico prova a vulnerabilidade, mas exfiltrar dados confidenciais consolida o risco crítico. O sistema W-SIEM salva uma "Chave de Integração" (API Key) secreta no banco de dados local do seu navegador (`localStorage`). Capture essa chave injetando um script que a recupere e a imprima na tela.

<details>
<summary><strong>💡 Resolução e Análise Técnica (Write-up)</strong></summary>

<br>

A vulnerabilidade se manifesta devido ao repasse direto dos dados da URL (`window.location.search`) para sinks inseguros sem tratamento adequado[].

#### Solução do Nível 1 (Bypass de Filtro)
A sanitização remove apenas as tags `<script>` padrão e a string `javascript:`[].
Utilizamos elementos secundários e os seus manipuladores de eventos embutidos para contornar essa regra e acessar o `innerHTML`[].
* **Payload:** `<img src=x onerror=alert(1)>`
* **Resultado:** O alerta modificado validará o acionamento e devolverá a `FLAG{1_d0m_f1lt3r_byp4ss_m4st3r}`[].

#### Solução do Nível 2 (Escalonamento via `eval`)
Existe um sink secundário (`eval`) escondido na lógica de auditoria do JS: `eval("var internalAuditLog = 'Search trace: " + query + "';");`[].
Para fugir das strings literais do código original e manipular a variável do sistema (`isAdmin`)[], nós fechamos a citação intencionalmente e reiniciamos a instrução com `true`, comentando o resto do lixo de código.
* **Payload:** `'; isAdmin=true; //`
* **Resultado:** O painel oculto roxo surgirá injetando na interface a `FLAG{2_d0m_pr1v3sc_3v4l}`.

#### Solução do Nível 3 (Roubo de LocalStorage)
Através do bypass de filtro usado no Nível 1, direcionamos o vetor para ler as propriedades em cache do navegador[]. O token alvo é `w-siem_integration_token`[].
* **Payload:** `<img src=x onerror=alert(localStorage.getItem("w-siem_integration_token"))>`
* **Resultado:** O sistema interpretará o valor guardado em memória, validará a extração de dados sensíveis e retornará o alerta confirmando a `FLAG{3_l0c4l5t0r4g3_t0k3n_st0l3n}`[].

**Como Mitigar:** 
O uso de propriedades que processam HTML e strings não tipadas como `innerHTML`, `outerHTML`, e `eval()` é estruturalmente perigoso. Substitua-os sempre que possível por `textContent` ou `innerText`, que forçam o DOM a renderizar os dados do usuário apenas como texto livre inofensivo.

</details>

-----

### 🙌 Créditos

Este projeto foi inspirado nos conceitos práticos de segurança ofensiva do **Hacking Club**, sendo estruturado para o aprimoramento em testes de invasão e pesquisa de vulnerabilidades web.

-----

### 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

<hr>

<p align="center">
<<<<<<< HEAD
  Desenvolvido por <b>vrsmarcos26</b>
</p>
=======
Desenvolvido por <b>vrsmarcos26</b>
</p>
>>>>>>> 1b0fba2 (Atualizações)

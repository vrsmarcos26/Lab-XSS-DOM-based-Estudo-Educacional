<div align="center">
  <h1>
    Laboratório de XSS Baseado em DOM
    <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Test%20Tube.png" alt="Tubo de Ensaio" width="45" height="45" />
  </h1>
</div>

<p align="center">
  <img alt="Linguagem Principal" src="https://img.shields.io/github/languages/top/vrsmarcos26/Lab-XSS-DOM-based-Estudo-Educacional?style=for-the-badge&color=F7DF1E">
  <img alt="Último Commit" src="https://img.shields.io/github/last-commit/vrsmarcos26/Lab-XSS-DOM-based-Estudo-Educacional?style=for-the-badge&color=green">
  <img alt="Hospedagem" src="https://img.shields.io/badge/GitHub_Pages-222222?style=for-the-badge&logo=githubpages&logoColor=white">
</p>

<p align="center">
  Um painel simulado de Inteligência de Ameaças (W-SIEM Security Events) intencionalmente vulnerável a ataques de Cross-Site Scripting (XSS) baseados no DOM.
</p>

<p align="center">
  <a href="#-aviso-importante">Aviso</a> •
  <a href="#-objetivos-de-aprendizagem">Objetivos</a> •
  <a href="#-tecnologias-utilizadas">Tecnologias</a> •
  <a href="#-como-acessar-o-laboratório">Como Acessar</a> •
  <a href="#-créditos">Créditos</a> •
  <a href="#-licença">Licença</a>
</p>

---

### ⚠️ Aviso Importante

> **Este projeto é intencionalmente vulnerável.** Ele foi criado para fins estritamente educacionais, com o objetivo de estudar segurança ofensiva em um ambiente controlado. **NÃO REUTILIZE ESTE CÓDIGO EM PROJETOS REAIS OU SERVIDORES DE PRODUÇÃO.**

---

### 🎯 Objetivos de Aprendizagem

Este laboratório foi projetado para demonstrar na prática:

-   Como a manipulação insegura de JavaScript pode levar a vulnerabilidades de XSS no lado do cliente (Client-Side).
-   A diferença fundamental entre XSS Refletido (processado no servidor) e DOM-based XSS (processado no navegador da vítima).
-   Como explorar múltiplos **Contextos de Injeção** (HTML Context via `innerHTML` e JavaScript Context via `eval()`).
-   O comportamento dos navegadores modernos (HTML5) em relação à injeção dinâmica da tag `<script>`.

---

### 🛠️ Tecnologias Utilizadas

O ambiente do laboratório é construído com tecnologias front-end modernas, dispensando a necessidade de um back-end real:

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5"></a>
  <a href="#"><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white" alt="JavaScript"></a>
  <a href="#"><img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind"></a>
</p>

---

### ⚙️ Como Acessar o Laboratório

Como este laboratório explora uma vulnerabilidade puramente Client-Side, **você não precisa instalar Docker ou configurar servidores locais.**

O desafio está hospedado gratuitamente através do GitHub Pages.

👉 **[Acesse o simulador aqui](https://vrsmarcos26.github.io/Lab-XSS-DOM-based-Estudo-Educacional/)**

*(Caso prefira auditar o código localmente, basta clonar este repositório e abrir o arquivo `index.html` diretamente no seu navegador).*

<details>
<summary><strong>💡 Como Resolver o Desafio (Write-up)</strong></summary>

<br>

O portal "W-SIEM" permite pesquisar logs de eventos de segurança. O que você digitar na barra de pesquisa será refletido tanto na URL (via parâmetro `?q=`) quanto no corpo da página (DOM).

Este laboratório possui **dois pontos de injeção (Sinks)** diferentes para você treinar suas habilidades:

#### 1. Explorando o Contexto HTML (`innerHTML`)
O desenvolvedor utilizou a propriedade `innerHTML` para renderizar o termo pesquisado na frase "Active filter: [termo]". 
Você pode usar payloads clássicos baseados em eventos para executar código arbitrário:
```html
<img src=x onerror="alert(document.domain)">

*Dica: O laboratório simula vulnerabilidades antigas, permitindo que até mesmo a tag `<script>alert(1)</script>` seja forçada a rodar no DOM.*

#### 2. Explorando o Contexto JavaScript (`eval`)
O sistema também registra silenciosamente o que o administrador está pesquisando usando a função `eval()`. 
Para explorar isso, você deve "quebrar" a string do JavaScript, executar o seu alerta e comentar o resto do código da aplicação original.
**Payload:**
```javascript
"; alert(1); //
```

Ao executar com sucesso um payload válido em qualquer um dos contextos, o script de auditoria do laboratório validará o ataque e revelará a flag de conclusão:
`FLAG{X55_J4V45CR1PT_5UC3550}`

</details>

---

### 🙌 Créditos

Este projeto foi inspirado e baseado nos excelentes conceitos e aulas práticas do **Hacking Club**, uma referência de alta qualidade para quem está estudando segurança web ofensiva no Brasil.

---

### 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

<hr>

<p align="center">
  Desenvolvido por <b>vrsmarcos26</b>
</p>

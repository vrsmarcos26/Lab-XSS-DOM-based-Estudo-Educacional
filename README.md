<div align="center">
  <h1>
    <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Brain.png" alt="Cérebro" width="45" height="45" />
    Laboratório de XSS Baseado em DOM
    <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Test%20Tube.png" alt="Tubo de Ensaio" width="45" height="45" />
  </h1>
</div>

<p align="center">
  <img alt="Linguagem Principal" src="https://img.shields.io/github/languages/top/vrsmarcos26/Lab-XSS-DOM-based?style=for-the-badge&color=F7DF1E">
  <img alt="Licença" src="https://img.shields.io/github/license/vrsmarcos26/Lab-XSS-DOM-based?style=for-the-badge&color=blue">
  <img alt="Último Commit" src="https://img.shields.io/github/last-commit/vrsmarcos26/Lab-XSS-DOM-based?style=for-the-badge&color=green">
</p>

<p align="center">
  Um laboratório simples e vulnerável por design para demonstrar e estudar ataques de Cross-Site Scripting (XSS) baseados no DOM, criado para fins estritamente educacionais.
</p>

<p align="center">
  <a href="#-aviso-importante">Aviso</a> •
  <a href="#-objetivos-de-aprendizagem">Objetivos</a> •
  <a href="#-tecnologias-utilizadas">Tecnologias</a> •
  <a href="#-como-rodar-o-laboratório">Como Rodar</a> •
  <a href="#-créditos">Créditos</a> •
  <a href="#-licença">Licença</a>
</p>

---

### ⚠️ Aviso Importante

> **Este projeto é intencionalmente vulnerável.** Ele foi criado para fins estritamente educacionais, com o objetivo de estudar segurança ofensiva em um ambiente controlado. **NÃO FAÇA O DEPLOY DESTA APLICAÇÃO EM UM SERVIDOR PÚBLICO OU DE PRODUÇÃO.** Use-o apenas localmente.

---

### 🎯 Objetivos de Aprendizagem

Este laboratório foi projetado para entender na prática:

-   Como a manipulação insegura de JavaScript pode levar a vulnerabilidades de XSS no lado do cliente.
-   A diferença fundamental entre XSS Refletido (processado no servidor) e DOM-based XSS (processado no navegador).
-   Os perigos de usar propriedades como `innerHTML` para renderizar conteúdo vindo do usuário.
-   A execução de vetores de ataque comuns para explorar essa falha e obter a execução de código.

---

### 🛠️ Tecnologias Utilizadas

O ambiente do laboratório é construído com tecnologias web básicas:

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5"></a>
  <a href="#"><img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS3"></a>
  <a href="#"><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white" alt="JavaScript"></a>
</p>

---

### ⚙️ Como Rodar o Laboratório

Para executar o laboratório, você só precisa de um navegador e uma forma de servir arquivos HTML localmente.

1.  **Clone o Repositório**
    ```bash
    git clone [https://github.com/vrsmarcos26/Lab-XSS-DOM-based.git](https://github.com/vrsmarcos26/Lab-XSS-DOM-based.git)
    cd Lab-XSS-DOM-based
    ```

2.  **Inicie um Servidor Local**
    Você pode usar o servidor embutido do Python ou do PHP, que são as formas mais simples.

    * Com **Python 3**:
        ```bash
        python3 -m http.server 8080
        ```
    * Com **PHP**:
        ```bash
        php -S localhost:8080
        ```
    * Alternativamente, use a extensão "Live Server" no VS Code.

3.  **Acesse o Laboratório**
    Abra seu navegador e acesse: `http://localhost:8080`

<details>
<summary><strong>💡 Como Resolver o Desafio (Write-up)</strong></summary>

<br>

1.  Acesse a página e você verá um campo de pesquisa.
2.  Digite qualquer texto (ex: "teste") e clique em "Pesquisar". O valor será refletido na tela, indicando que o DOM foi modificado.
3.  Para explorar a vulnerabilidade de XSS, injete código HTML/JavaScript no campo. Um payload clássico é:
    ```html
    <img src=x onerror="alert('DOM XSS by vrsmarcos26')">
    ```
4.  Ao clicar em "Pesquisar", o navegador tentará renderizar a tag `<img>`. Como o `src` é inválido, o evento `onerror` será disparado, executando o JavaScript contido nele.
5.  O script do laboratório detectará o uso de um payload malicioso e exibirá a flag na tela:
    ```
    FLAG{X55_J4V45CR1PT_5UC3550}
    ```

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

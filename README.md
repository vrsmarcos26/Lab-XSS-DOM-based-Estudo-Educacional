# 🧠 Lab XSS DOM-based – Estudo Educacional

Este repositório contém um laboratório simples que simula vulnerabilidades do tipo **DOM-based XSS**. O objetivo é totalmente educacional.

---

## 📚 Sobre o projeto

Este lab foi desenvolvido com base nas aulas do **Hacking Club** como parte do meu estudo pessoal de segurança ofensiva.

O foco aqui é entender:
- Como o uso inseguro de JavaScript pode levar a execuções indesejadas.
- A diferença entre XSS refletido (servidor) e DOM XSS (navegador).
- O perigo de funções como `innerHTML`.

---

## 🧪 Como funciona

- O valor do input é manipulado diretamente pelo JavaScript via DOM.
- Se o input contiver tags como `<script>` ou atributos como `onerror=`, o código será executado.
- A flag é exibida quando um vetor suspeito é detectado.

---

## 💻 Como rodar localmente

1. Clone este repositório:
   ```
   git clone https://github.com/seu-usuario/xss-dom-lab.git
   cd xss-dom-lab
   ```
2. Inicie um servidor local (ex: com Python, PHP, ou extensões de live server):

Com Python 3:

```
python3 -m http.server 8080
```

Com PHP:

```
php -S localhost:8080
```

3. Acesse no navegador:
http://localhost:8080

## 📝 Como realizar o lab (Write-up)
Digite no campo de pesquisa qualquer string e clique em "Pesquisar".

Veja o valor refletido na tela.

Teste um payload como:
```
<img src=x onerror="alert('DOM XSS')">
```

Se detectado, o lab exibirá a flag:
```
FLAG{XSS_JAVASCRIPT_SUCESSO}
```

## 🚨 Aviso de segurança
Este projeto é vulnerável por design e não deve ser executado em ambientes de produção. É voltado para fins de estudo em segurança ofensiva.

## 🙌 Créditos
Baseado nos conceitos e aulas do Hacking Club – referência excelente para quem está aprendendo sobre segurança web ofensiva.

<h1>Meals - Aplicativo de Receitas</h1> 

<p align="center">
  <img src="https://img.shields.io/static/v1?label=dart&message=language&color=blue&style=for-the-badge&logo=DART"/>  
  <img src="https://img.shields.io/static/v1?label=flutter&message=framework&color=blue&style=for-the-badge&logo=FLUTTER"/>  
  <img src="http://img.shields.io/static/v1?label=License&message=MIT&color=green&style=for-the-badge"/>   
  <img src="http://img.shields.io/static/v1?label=TESTES&message=%3E100&color=GREEN&style=for-the-badge"/>  
   <img src="http://img.shields.io/static/v1?label=STATUS&message=CONCLUIDO&color=GREEN&style=for-the-badge"/>
</p>

> Status do Projeto: :heavy_check_mark: (concluido)
---

### 📖 Tópicos 

:small_blue_diamond: [Descrição do projeto](#-descrição-do-projeto)

:small_blue_diamond: [Funcionalidades](#-funcionalidades)

:small_blue_diamond: [Layout da Aplicação](#-layout)

:small_blue_diamond: [Pré-requisitos](#-pré-requisitos)

:small_blue_diamond: [Como execultar a aplicação](#-como-execultar-a-aplicação)

:small_blue_diamond: [Casos de uso](#-casos-de-uso)

:small_blue_diamond: [Linguagens, dependencias e libs utilizadas](#-linguagens-dependencias-e-libs-utilizadas)

:small_blue_diamond: [Desenvolvedores Contribuintes](#-desenvolvedores-contribuintes)

:small_blue_diamond: [Autor](#-autor)

--- 

## 💻 Descrição do projeto 

<p align="justify">
  Projeto realizado em Flutter, referente a um app de receitas. Foi utilizado varios conceitos da linguagem tais como:
  "ValueNotifier - notifica seus ouvintes quando o valor e alterado"; "Animation -  interpola os valores usados ​​para guiar uma animação."; 
  "Hero - animar um widget de uma tela para a próxima"; "Transform - Cria um widget que transforma seu filho"; "ClipRRect - Cria um clipe 
  retangular arredondado"; "Matrix4 - permitem mover, girar, redimensionar e inverter"; "PageTransitionsBuilder - Animação na transição de 
  telas"; "Passagem de parâmetros entre as telas"; entre outros.
</p>

---

## ⚙️ Funcionalidades

:heavy_check_mark: Abre diretamente na tela Home, onde contém as refeições separadas por categorias. Podendo alterar entre "Categorias" e "Favoritos". Utilizamos um "BottomNavigationBar" personalizado e também trocamos a animação de transição de telas utilizando o "PageTransitionsBuilder".

:heavy_check_mark: Tanto as telas de "Categorias" ou "Favoritos", ao rolar para cima para melhor visualizar, automaticamente a "BottomNavigationBar" desaparece e reaparece ao rolar para baixo. Utilizamos o "ValueNotifier" para realizar a notificação para desaparecer ou reaparecer com o nosso "BottomNavigationBar".

:heavy_check_mark: Nosso menu Drawer, utilizamos o pacote "drawer_swipe" com algumas modificações no código fonte do mesmo. O pacote possui varias funcionalidades como o "ClipRRect", "Transform" e "Matrix4" para realizar a animação de clone da tela, arendondamento das bordas e efeito de deslocamento para o surgimento do Drawer.
  
:heavy_check_mark: Ao abrir alguma refeição, temos a tela com os detalhes, informando o tempo de preparo, se o prato é facil ou dificil de ser preparado e o preço. Clicando na imagem da refeição a pagina com o passo a passo será exibida.     

:heavy_check_mark: Na tela do passo a passo da receita, temos os "Ingredientes" onde é possivel realizar a rolagem dos mesmos "ListView Builder".
                   Temos os "Passos" que possui a opção de rolagem também outro "ListView Builder" e toda a tela é envolvida com o "SingleChildScrollView", possibilitando a rolagem total.
                   Para finalizar possuimos um "FloatingActionButton" com um icone de um coração onde será possivel marcar a refeição como favorita.

:heavy_check_mark: A tela de configurações é acessada através do menu principal, a mesma possui diversos filtros que podem ser marcados "SwitchListTile".

---

## 🎨 Layout 

<p align="center">
  <img alt="Home" title="#Home" src="https://user-images.githubusercontent.com/77983152/113188899-fddaea00-9230-11eb-8c53-080be35e37a8.png" width="200px">

  <img alt="Tabline" title="#Tabline" src="https://user-images.githubusercontent.com/77983152/113189691-d6d0e800-9231-11eb-9010-2b753f2244ea.png" width="200px">

  <img alt="Tabline" title="#Tabline" src="https://user-images.githubusercontent.com/77983152/113189161-45fa0c80-9231-11eb-8494-9863a5095ac9.png" width="200px">

  <img alt="Tabline" title="#Tabline" src="https://user-images.githubusercontent.com/77983152/113189253-5e6a2700-9231-11eb-921e-541fbc7d0266.png" width="200px">

  <img alt="Tabline" title="#Tabline" src="https://user-images.githubusercontent.com/77983152/113189330-780b6e80-9231-11eb-9e37-5a92a515b2de.png" width="200px">

  <img alt="Add" title="#Add" src="https://user-images.githubusercontent.com/77983152/113188998-1945f500-9231-11eb-9de3-fe0d6d92f4e2.png" width="200px">

  <img alt="Tabline" title="#Tabline" src="https://user-images.githubusercontent.com/77983152/113189079-2e228880-9231-11eb-90a9-c5aef2dd979f.png" width="200px">            
</p>

---

## 🎯 Pré-requisitos

:warning: [Flutter](https://flutter.dev/docs/get-started/install)

:warning: [Android Studio](https://developer.android.com/studio)

:warning: [Vscode](https://code.visualstudio.com/download)

---

## ▶️ Como execultar a aplicação

No terminal, clone o projeto: 

```
git clone https://github.com/AndersonD-art/meals.git
```
---

## 📌 Casos de uso

👍 Projeto inspirado no professor, desenvolvedor e youtuber Leonardo Moura Leitão da COD3R - https://www.udemy.com/course/curso-flutter/. O melhor curso de flutter da Udemy em minha opinião.

💬 Trata-se de um app de receitas, que utiliza de diversas animações para deixá-lo bem intuitivo e divertido. 

💬 Logo de inicio já ira surgir a tela home, com diversas categorias de comidas separadas pelo tipo, selecionando alguma destas categorias será exibido as informações sobre o prato, clicando na imagem da refeição será redirecionada a tela de passo a passo com os ingredientes necessarios e passos para o preparo com um botão flutuante para favoritar a receita.

💬 Temos a aba com o favoritos onde serão exibidos todas as refeições marcadas como favoritas.

💬 O nosso Drawer ou menu, é cercado de animações e nos possibilita acessar as paginas de refeições, favoritos e configurações.

💬 Já na pagina de configurações podemos realizar diversos filtros para eliminarmos por exemplo as receitas que contem "glúten".

---

## 🛠 Linguagens, dependencias e libs utilizadas

- [Lab: Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

---

## 👨‍💻 Desenvolvedores Contribuintes

Um super thanks 👏 para Leonardo Moura Leitão da cod3r pela ajuda.

---

## 🎓 Autor

 <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/77983152?s=460&u=f61c18670116cb318cdf26e7523643a6dccb5680&v=4" width="100px;" alt=""/>
 <br />
 <sub><b>Anderson David</b></sub> ☕
 <br />

[![Linkedin Badge](https://img.shields.io/badge/-AndersonDavid-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/anderson-david-ti)](https://www.linkedin.com/in/anderson-david-ti) 
[![Hotmail Badge](https://img.shields.io/badge/-andersondavidti@hotmail.com-c14438?style=flat-square&logo=Hotmail&logoColor=white&link=mailto:andersondavidti@hotmail.com)](mailto:andersondavidti@hotmail.com)

---

## 📝 Licença 

The [MIT License](https://github.com/AndersonD-art/meals/blob/main/LICENSE)(MIT)

Copyright :copyright: 2021 - Meals
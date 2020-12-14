# trab3pp backend
Este projeto é para o Trabalho 3 da disciplina de Práticas em Programação do curso de Engenharia de Software da UNIPAMPA.

Para o backend está sendo utilizado o Spring Boot, com a linguagem Kotlin. Junto dele, é utilizado um banco de dados MySQL, inicializado com o `docker-compose`. Caso queira rodar um banco local, basta mudar as variáveis de ambiente.

Para rodar o projeto, basta ter o Docker e o docker-compose instalados e executar um dos seguintes comandos:

* Para buildar com o código local, rode `docker-compose up` 

* Para baixar as imagens do docker-hub, rode `docker-compose -f docker-compose-remote.yml up`

PS: Há uma coleção do Postman com algumas _requests_ de exemplo.

# trab3pp frontend
Este projeto é para o Trabalho 3 da disciplina de Práticas em Programação do curso de Engenharia de Software da UNIPAMPA.

Para o frontend está sendo utilizado a tecnologia Flutter e a linguagem de programação Dart para plataforma Desktop. Para construção do projeto, foi utilizado o padrão de projeto BLOC. Para rodar o projeto, é necessário ter o flutter instalado na máquina e altera-lo para o canal de dev, pois nesta plataforma de Desktop, ainda está em fase Alpha.

* Para buildar com o código, rode `flutter run`

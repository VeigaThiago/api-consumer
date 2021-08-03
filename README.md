# Dienekes ApiConsumer Challenge

## Desafio para o processo seletivo da Dienekes

<h4 align="center"> 
	  ApiConsumer 🚀 Finalizado.  
</h4>

### Objetivos

- [x] Realize chamadas em uma API REST para extrair um conjunto de números da nossa base de dados.
- [x] Ordenar todos os números extraídos na etapa anterior.
- [x] Expor uma API que disponibiliza o conjunto final de números ordenados da etapa anterior.

### Pré-requisitos

Antes de começar, você vai precisar ter instalado [Elixir](https://elixir-lang.org/) em sua máquina e, se necessários, dar uma dar uma olhada nas seguintes ferramentas:
[Phoenix Framework](https://www.phoenixframework.org/), [Absinthe](https://absinthe-graphql.org/), [Tesla](https://github.com/teamon/tesla) e [GraphQL](https://graphql.org/).

### Rodando o servidor

Para rodar o servidor é recomendado subir um [docker container de Postgres](https://hub.docker.com/_/postgres).
As configurações do banco de dados encontram-se nos arquivos docker-compose.yml, config.env e na pasta config. Como padrão, está definido:
  * Server = "database"
  * Login = "postgres"
  * Password = "postgres"
  
Suba o arquivo docker-compose na pasta do projeto, `docker-compose up` ou `sudo docker-compose up` e, caso queira, utilize o adminer (http://localhost:8080/) com as credenciais acima

### Utilizando a aplicação
Para o funcionamento da aplicação, será necessário enviar as seguintes rotas na api do GraphQL:
* Execute as migrations:
`mix ecto.migrate`
* Inicie a aplicação:
`iex -S mix phx.server`
* Chame a função que consome a API:
```elixir
ApiConsumer.Extract.consumer
```
* Quando o processo de consumo da api terminar, será indicado pelo átomo `:all_numbers_read`, então poderá executar a query:
```query
{
   getNumbers{
	allNumbers
  }
}
```
**Obs.:** O phoenix disponibiliza uma interface de chamada GraphQL (http://localhost:4000/api/graphiql), se preferir, poderá fazer a chamada da query por lá.
### Testes
Por fim, mas não menos importante, a execução dos nossos testes, para isso execute o seguinte comando na pasta raiz do projeto:
```
$ mix test test/api_consumer/api_consumer_test.exs
```

---

Feito por Thiago Veiga! 🚀🚀

[![Linkedin Badge](https://img.shields.io/badge/-Thiago-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/thiago-veiga-9bb2a5136/)](https://www.linkedin.com/in/thiago-veiga-9bb2a5136/) 
[![Gmail Badge](https://img.shields.io/badge/-thiagoveiiga@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:thiagoveiiga@gmail.com)](mailto:thiagoveiiga@gmail.com)

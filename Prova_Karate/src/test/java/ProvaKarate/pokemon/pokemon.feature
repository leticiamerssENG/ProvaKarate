Feature: Testando API PokeAPI

Background: Executa antes de cada teste
    * def url_base = 'https://pokeapi.co/api/v2/'

Scenario: Testando retorno caterpie e verificando o JSON
    Given url url_base
    And path 'pokemon/caterpie'
    When method get
    Then status 200
    And match response.name == "caterpie"   
    And match response.id == 10  


Scenario: Testando retorno bulbasaur e verificando o JSON
    Given url url_base
    And path 'pokemon/bulbasaur'
    When method get
    Then status 200
    And match response.name == "bulbasaur"   
    And match response.id == 1 

Scenario: Testando retorno pokemon yellow entrando em um dos elementos do array de idiomas e testando retorno do JSON
    Given url url_base
    And path '/version/3/'
    When method get
    Then status 200
    And def idioma = $.names[1].language.url
    And print idioma
    And url idioma
    When method get
    Then status 200
    And match response.name == "ko"
    And match response.id == 3 

Scenario: Testando retorno pokemon ruby entrando em um dos elementos do array de idiomas e testando retorno do JSON
    Given url url_base
    And path '/version/5/'
    When method get
    Then status 200
    And def idioma = $.names[3].language.url
    And print idioma
    And url idioma
    When method get
    Then status 200
    And match response.name == "fr"
    And match response.id == 5   
    
Scenario: Testando retorno pokemon blue entrando em um dos elementos do array de idiomas e testando retorno do JSON
    Given url url_base
    And path '/version/2/'
    When method get
    Then status 200
    And def idioma = $.names[4].language.url
    And print idioma
    And url idioma
    When method get
    Then status 200
    And match response.name == "de"
    And match response.id == 6  

Scenario: Testando retorno com informações incorretas 
    Given url url_base 
    And path 'pokemon/leticia'
    When method get
    Then status 404  
    
Scenario: Testando caso de sensitive case
    Given url url_base 
    And path 'pokemon/METAPOD'
    When method get
    Then status 404      
 
#Caso de teste desenvolvido apenas para atender o requisito da prova, pois, a API utilizada permite realizar apenas o método GET segundo a própria documentação da mesma.

#Scenario: Criando um novo Pokemon usando o método POST
#   Given url url_base 
#   And path 'pokemon/'
#   And request {name:'teste', url: 'teste1'} 
#   When method POST
#   Then status 201  
#   And match $.name == 'teste'
#   And match $.url == 'teste1'




    
    
    
    
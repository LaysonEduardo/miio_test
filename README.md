# miio_test

Teste técnico - Exibir postagens com visualização das mesmas e scroll infinito.

## History

- Exibir postagens com visualização de detalhes das mesmas.
- As postagens devem conter título, conteúdo, imagem, comentários e infos do autor.
- Permitir buscas de postagens a partir de um textfield.
- Navegação entre postagens com scroll infinito.

## Decisões de uso (Packages)

Com base na History foi decidido utilizar os seguintes packages na aplicação:
    
 - UI
    - flutter_svg (Para uso dos icones vindos do Figma).
    - shimmer (Para criar um efeito de loading).
    - fluttertoast (Para exibir toasts informativos em recursos não implementados).
   ---

 - Dependecy Injection/Navegation
    - flutter_modular
   ---
 - State Management
    - flutter_bloc
   ---
 - Networking
    - dio (Para requisições HTTP).
   ---
 - Unit Tests   
    - http_mock_adapter (Para mockar o adaptador HTTP e manipular os retornos).
   --- 


## Tasks 

### Regra de negócio e afins

- [x] Criar Models Post, Comment e User.
- [x] Criar Services para popular esses models.
- [x] Implementar e testar services com Dio.
- [x] Criar integração com Modular.

### Tela 1

- [x] Criar os arquivos e classes referente ao Bloc.
- [x] Criar home page com lista de postagens.
- [x] Criar scroll infinito.
- [x] Criar post page com detalhes da postagem.
- [x] Integrar os events e states do bloc com a Home.
- [x] Criar busca de postagens.

### Tela 2

- [x] Criar arquivos e classes referente ao Bloc.
- [x] Criar eventos de fetch do post, comentários e usuário que postou.
- [x] Integrar os events e states do bloc com a tela.


## Video
https://www.youtube.com/embed/XWW4X6SP-6w
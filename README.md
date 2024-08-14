## Utilização

A aplicação possui alguns comandos disponíveis para CRUD. Aqui está um exemplo básico de como usar a CLI:

### Comando de Ajuda

Para visualizar todos os comandos disponíveis e suas descrições, use o comando:

```bash
dart ./bin/admin_cli.dart students -h
```

Isso exibirá uma lista dos subcomandos disponíveis.

### Comandos Disponíveis

1. **delete**: Deleta um estudante pelo ID.

```bash
dart ./bin/admin_cli.dart students delete --id=<student_id>
```

**Parâmetros**:
- `--id` ou `-i`: ID do estudante a ser deletado.

2. **findAll**: Busca todos os estudantes cadastrados.

```bash
dart ./bin/admin_cli.dart students findAll
```

**Parâmetros**:
- Será solicitado se deseja listar também os cursos dos estudantes.

3. **findById**: Busca um estudante pelo ID.

```bash
dart ./bin/admin_cli.dart students findById --id=<student_id>
```

**Parâmetros**:
- `--id` ou `-i`: ID do estudante a ser buscado.

4. **insertByPath**: Insere estudantes a partir de um arquivo CSV.

```bash
dart ./bin/admin_cli.dart students insertByPath --file=<file_path>
```

**Parâmetros**:
- `--file` ou `-f`: Caminho do arquivo CSV com os dados dos estudantes.

5. **updateByPath**: Atualiza um estudante específico a partir de um arquivo CSV.

```bash
dart ./bin/admin_cli.dart students updateByPath --file=<file_path> --id=<student_id>
```

**Parâmetros**:
- `--file` ou `-f`: Caminho do arquivo CSV com os dados do estudante.
- `--id` ou `-i`: ID do estudante a ser atualizado.

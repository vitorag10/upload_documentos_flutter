import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent),
      ),
      home: PguploadPage(),
    );
  }
}

class PguploadPage extends StatefulWidget {
  @override
  _PguploadPageState createState() => _PguploadPageState();
}

class _PguploadPageState extends State<PguploadPage> {
  String? _tipoOperadora = 'Pessoa Física';
  Map<String, String?> _uploadedFiles = {}; // Armazenar os nomes dos arquivos anexados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Text(
            '',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logogdf.png',
                    width: 210,
                    height: 110,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SECRETARIA DE TRANSPORTE E MOBILIDADE',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontFamily: 'Open Sans',
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(height: 0),
                        Text(
                          'SEMOB',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                color: Color(0xFF005EB8),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Cadastro de Operador',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipo da Operadora',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Pessoa Física'),
                            value: 'Pessoa Física',
                            groupValue: _tipoOperadora,
                            onChanged: (value) {
                              setState(() {
                                _tipoOperadora = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Pessoa Jurídica de Direito Privado'),
                            value: 'Pessoa Jurídica de Direito Privado',
                            groupValue: _tipoOperadora,
                            onChanged: (value) {
                              setState(() {
                                _tipoOperadora = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Pessoa Jurídica de Direito Público'),
                            value: 'Pessoa Jurídica de Direito Público',
                            groupValue: _tipoOperadora,
                            onChanged: (value) {
                              setState(() {
                                _tipoOperadora = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    if (_tipoOperadora == 'Pessoa Física') _buildPessoaFisicaFields(),
                    if (_tipoOperadora == 'Pessoa Jurídica de Direito Privado') _buildPessoaJuridicaPrivadaFields(),
                    if (_tipoOperadora == 'Pessoa Jurídica de Direito Público') _buildPessoaJuridicaPublicaFields(),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Navegação removida
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            foregroundColor: Colors.white,
                          ),
                          icon: Icon(Icons.check),
                          label: Text("Enviar"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldAndUpload(String textLabel, String? uploadLabel) {
    return Row(
      children: [
        // Campo de texto com tamanho reduzido para CEP
        if (textLabel == 'CEP')
          SizedBox(
            width: 850, // Definir uma largura menor para o campo de CEP
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: textLabel,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          )
        // Campo de texto para Bairro
        else if (textLabel == 'Bairro')
          SizedBox(
            width: 850, // Definir uma largura específica para o campo de Bairro
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: textLabel,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          )
        // Outros campos de texto normais
        else
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: textLabel,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        SizedBox(width: 16),
        // Botão de upload se houver necessidade
        if (uploadLabel != null && uploadLabel.isNotEmpty) ...[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(uploadLabel),
                SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () async {
                    String? result = await _pickFile();
                    if (result != null) {
                      setState(() {
                        _uploadedFiles[uploadLabel] = result;
                      });
                    }
                  },
                  icon: Icon(Icons.attach_file, color: Colors.white),
                  label: Text(
                    _uploadedFiles[uploadLabel] == null ? 'Anexar arquivo PDF' : 'Alterar arquivo',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xFF005EB8)),
                    padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                if (_uploadedFiles[uploadLabel] != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Arquivo anexado: ${_uploadedFiles[uploadLabel]}',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _uploadedFiles[uploadLabel] = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }


  Widget _buildPessoaFisicaFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Documentos para Pessoa Física', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        SizedBox(height: 16),
        _buildTextFieldAndUpload('Número do CPF', 'Cópia do CPF'),
        _buildTextFieldAndUpload('Número da Carteira de Identidade', 'Cópia da Carteira de Identidade'),
        _buildTextFieldAndUpload('Endereço', 'Cópia do comprovante de residência (EM NOME DO CONTRATADO)'),
        _buildTextFieldAndUpload('UF', 'Certidão Negativa de Débitos junto à Secretaria de Estado de Fazenda do DF'),
        _buildTextFieldAndUpload('Bairro', null), // Campo de texto sem botão de upload
        _buildTextFieldAndUpload('CEP', null), // Campo de texto sem botão de upload
      ],
    );
  }

  Widget _buildPessoaJuridicaPrivadaFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Documentos para Pessoa Jurídica de Direito Privado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        SizedBox(height: 16),
        _buildTextFieldAndUpload('Número do CNPJ', 'Cópia do CNPJ - Comprovante de Inscrição e Situação Cadastral'),
        _buildTextFieldAndUpload('Número de Inscrição (INSS)', 'Contrato Social e suas alterações'),
        _buildTextFieldAndUpload('Endereço', 'Certidão Negativa de Débitos Relativos aos Tributos Federais'),
        _buildTextFieldAndUpload('UF', 'Cópia do comprovante de endereço (EM NOME DA EMPRESA)'),
        _buildTextFieldAndUpload('Bairro', 'Certidão Negativa de Débitos junto à Secretaria de Estado de Fazenda do DF'),
        _buildTextFieldAndUpload('CEP', null), // Campo de texto sem botão de upload
      ],
    );
  }

  Widget _buildPessoaJuridicaPublicaFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Documentos para Pessoa Jurídica de Direito Público', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        SizedBox(height: 16),
        _buildTextFieldAndUpload('Número do CNPJ', 'Cópia do CNPJ - Comprovante de Inscrição e Situação Cadastral'),
        _buildTextFieldAndUpload('Número do Cartão de Cadastro (CF/DF)', 'Ato de instituição e suas alterações'),
        _buildTextFieldAndUpload('Endereço', 'Cópia do comprovante de endereço (EM NOME DA ENTIDADE)'),
        _buildTextFieldAndUpload('UF', 'Cópia do Cartão de Cadastro Fiscal do DF (CF/DF)'),
        _buildTextFieldAndUpload('Bairro', 'Guias de Recolhimento do ISS ou ICMS'),
        _buildTextFieldAndUpload('CEP', null), // Campo de texto sem botão de upload
      ],
    );
  }

  // Função para abrir o File Picker e selecionar um arquivo PDF
  Future<String?> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      return file.name; // Retorna o nome do arquivo selecionado
    }
    return null; // Retorna null se nenhum arquivo for selecionado
  }
}

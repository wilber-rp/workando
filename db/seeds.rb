# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 1.times do
#   interest = InterestArea.create!(name: "Garçom") do
#     Job.create!(interest_area_id: interest, description: '22 hora', address: "Rua joão", salary: 22)
# end

# 1.times do
#   interest = InterestArea.create!(name: "Pedreiro") do
#     Job.create!(interest_area_id: interest, description: '22 hora', address: "Rua joão", salary: 22)
# end

InterestArea.create!(name: "Garçom")
InterestArea.create!(name: "Pedreiro")
InterestArea.create!(name: "Jardineiro")
InterestArea.create!(name: "Diarista")
InterestArea.create!(name: "BarMan")
InterestArea.create!(name: "Pintor")
InterestArea.create!(name: "Capinteiro")
InterestArea.create!(name: "Segurança")
InterestArea.create!(name: "Recepcionista")
InterestArea.create!(name: "Motorista")




# POSSÍVEIS CATEGORIAS DE JOBS ABAIXO


# InterestArea.create!(name: "Operador de telemarketing ativo e receptivo")
# InterestArea.create!(name: "Inspetor de alunos de escola pública")
# InterestArea.create!(name: "Operador de telemarketing receptivo")
# InterestArea.create!(name: "Auxiliar de desenvolvimento infantil")
# InterestArea.create!(name: "Atendente de lanchonete")
# InterestArea.create!(name: "Vendedor de comércio varejista")
# InterestArea.create!(name: "Atendente de lojas e mercados")
# InterestArea.create!(name: "Frentista")
# InterestArea.create!(name: "Auxiliar de conservação de vias")
# InterestArea.create!(name: "Atendente de farmácia")
# InterestArea.create!(name: "Magarefe")
# InterestArea.create!(name: "Copeiro")
# InterestArea.create!(name: "Varredor de rua")
# InterestArea.create!(name: "Repositor de mercadorias")
# InterestArea.create!(name: "Camareiro de hotel")
# InterestArea.create!(name: "Operador de caixa")
# InterestArea.create!(name: "Auxiliar nos serviços de alimentação")
# InterestArea.create!(name: "Embalador")
# InterestArea.create!(name: "Armazenista")
# InterestArea.create!(name: "Agente comunitário de saúde")
# InterestArea.create!(name: "Motociclista no transporte")
# InterestArea.create!(name: "Recepcionista em geral")
# InterestArea.create!(name: "Recepcionista de consultório")
# InterestArea.create!(name: "Costureiro na confecção em série")
# InterestArea.create!(name: "Costureiro")
# InterestArea.create!(name: "Vendedor em comércio atacadista")
# InterestArea.create!(name: "Contínuo")
# InterestArea.create!(name: "Almoxarife")
# InterestArea.create!(name: "Trabalhador da manutenção de edificações")
# InterestArea.create!(name: "Trabalhador de serviços de limpeza")
# InterestArea.create!(name: "Servente de obras")
# InterestArea.create!(name: "Garçom")
# InterestArea.create!(name: "Ajudante de motorista")
# InterestArea.create!(name: "Trabalhador agropecuário")
# InterestArea.create!(name: "Açougueiro")
# InterestArea.create!(name: "Cozinheiro geral")
# InterestArea.create!(name: "Cobrador de transportes coletivos")
# InterestArea.create!(name: "Professor nível médio na educação infantil")
# InterestArea.create!(name: "Padeiro")
# InterestArea.create!(name: "Faxineiro")
# InterestArea.create!(name: "Auxiliar de escritório")
# InterestArea.create!(name: "Trabalhador volante da agricultura")
# InterestArea.create!(name: "Escriturário de banco")
# InterestArea.create!(name: "Assistente administrativo")
# InterestArea.create!(name: "Trabalhador de pecuária")
# InterestArea.create!(name: "Técnico de enfermagem")
# InterestArea.create!(name: "Mecânico de automóveis")
# InterestArea.create!(name: "Zelador de edifício")
# InterestArea.create!(name: "Assistente de vendas")
# InterestArea.create!(name: "Vigia")
# InterestArea.create!(name: "Motorista de carro de passeio")
# InterestArea.create!(name: "Auxiliar de contabilidade")
# InterestArea.create!(name: "Agente de saúde pública")
# InterestArea.create!(name: "Auxiliar de enfermagem")
# InterestArea.create!(name: "Auxiliar de manutenção predial")
# InterestArea.create!(name: "Porteiro de edifícios")
# InterestArea.create!(name: "Conferente de carga")
# InterestArea.create!(name: "Professor nível médio no ensino fundamental")
# InterestArea.create!(name: "Gerente de loja")
# InterestArea.create!(name: "Motorista de furgão")
# InterestArea.create!(name: "Motorista de ônibus urbano")
# InterestArea.create!(name: "Carregador")
# InterestArea.create!(name: "Pedreiro")
# InterestArea.create!(name: "Motorista de ônibus rodoviário")
# InterestArea.create!(name: "Promotor de vendas")
# InterestArea.create!(name: "Professor do EJA ensino fundamental")
# InterestArea.create!(name: "Alimentador de linha de produção")
# InterestArea.create!(name: "Professor de ensino superior")
# InterestArea.create!(name: "Secretaria executiva")
# InterestArea.create!(name: "Operador de empilhadeira")
# InterestArea.create!(name: "Professor de nível superior na educação infantil")
# InterestArea.create!(name: "Motorista de caminhão")
# InterestArea.create!(name: "Auxiliar de pessoal")
# InterestArea.create!(name: "Operador de máquinas")
# InterestArea.create!(name: "Carregador (armazém)")
# InterestArea.create!(name: "Inspetor de qualidade")
# InterestArea.create!(name: "Eletricista de manutenção eletroeletrônica")
# InterestArea.create!(name: "Coordenador pedagógico")
# InterestArea.create!(name: "Tratorista agrícola")
# InterestArea.create!(name: "Supervisor de vendas")

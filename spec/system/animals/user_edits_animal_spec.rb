require 'rails_helper'

describe 'User edits animal' do
    it 'successfully' do
        user = DeviseUser.create!(email: 'teste1@apets.com', password: '123456', name: 'Nome de Teste', cpf: '12345678900', phone: '11999999999', date_of_birth: '01/01/1990')
        Animal.create!(name: 'Nome do Animal', breed: 'Raça do Animal', age: 1, additional_info: 'Informações adicionais', devise_user: user)

        login_as user, scope: :devise_user
        visit root_path
        click_on 'Editar'
        fill_in 'Name', with: 'Nome do Animal Editado'
        click_on 'Salvar Alterações'

        expect(page).to have_content('Animal atualizado com sucesso.')
    end
end
require 'rails_helper'

describe 'User register animal' do
    it 'successfully' do
        user = DeviseUser.create!(email: 'teste1@apets.com', password: '123456', name: 'Nome de Teste', cpf: '12345678900', phone: '11999999999', date_of_birth: '01/01/1990')

        login_as user, scope: :devise_user
        visit root_path
        click_on 'Cadastrar Animal'
        fill_in 'Name', with: 'Nome do Animal'
        fill_in 'Breed', with: 'Raça do Animal'
        fill_in 'Age', with: '1'
        fill_in 'Additional info', with: 'Informações adicionais do animal'
        click_on 'Cadastrar Animal'

        expect(page).to have_content('Pet cadastrado com sucesso.')
        expect(page).to have_content('Nome do Animal')
        expect(page).to have_content('Raça do Animal')
        expect(page).to have_content('1')
        expect(page).to have_content('Informações adicionais do animal')
    end
end
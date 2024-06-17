require 'rails_helper'

describe 'User signs in to application' do
    it 'successfully' do
        user = DeviseUser.create!(email: 'teste1@apets.com', password: '123456', name: 'Nome de Teste', cpf: '12345678900', phone: '11999999999', date_of_birth: '01/01/1990')
        
        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: 'teste1@apets.com'
        fill_in 'Password', with: '123456'
        click_on 'Log in'

        expect(page).to have_content('Login efetuado com sucesso.')
        expect(page).to have_content('Bem-vindo ao seu dashboard, Nome de Teste!')
        expect(page).not_to have_link('Entrar')
        expect(current_path).to eq('/dashboard')
    end

    it 'and logs out' do
        user = DeviseUser.create!(email: 'teste1@apets.com', password: '123456', name: 'Nome de Teste', cpf: '12345678900', phone: '11999999999', date_of_birth: '01/01/1990')
        
        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: 'teste1@apets.com'
        fill_in 'Password', with: '123456'
        click_on 'Log in'
        click_on 'Logout'

        expect(page).to have_content('Logout efetuado com sucesso.')
    end

    it 'and must fill in all fields' do
        
        visit root_path
        click_on 'Entrar'
        click_on 'Log in'

        expect(page).to have_content('Email ou senha inválidos.')
    end
end
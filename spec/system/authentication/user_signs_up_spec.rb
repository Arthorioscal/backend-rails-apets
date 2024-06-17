require 'rails_helper'

describe 'User signs in to application' do
    it 'successfully' do

        visit root_path
        click_on 'Cadastrar'
        fill_in 'Email', with: 'emaildetestes@apets.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        fill_in 'Name', with: 'Nome de Teste'
        fill_in 'Cpf', with: '123.456.789-00'
        fill_in 'Phone', with: '11 99999-9999'
        click_on 'Finalizar Cadastro'

        expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
    end

    it 'and must fill in all fields' do

        
        visit root_path
        click_on 'Cadastrar'
        fill_in 'Email', with: ''
        fill_in 'Password', with: ''
        fill_in 'Password confirmation', with: ''
        fill_in 'Name', with: ''
        fill_in 'Cpf', with: ''
        fill_in 'Phone', with: ''
        click_on 'Finalizar Cadastro'

        expect(page).to have_content('Email não preenchido')
        expect(page).to have_content('Password não preenchido')
        expect(page).to have_content('Name não preenchido')
        expect(page).to have_content('Cpf não preenchido')
        expect(page).to have_content('Phone não preenchido')
    end
end
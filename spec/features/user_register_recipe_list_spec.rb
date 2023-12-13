require 'rails_helper'

describe 'Usuário cria lista de receitas' do
  it 'com sucesso' do 
    user = create(
      :user, email: 'user@email.com',
      password: '123456', role: :user
    )

    login_as user
    visit root_path
    within click_on 'Registrar lista de receitas'
    fill_in 'Nome', with: 'Natal'
    click_on 'Salvar'

    expect(RecipeList.last.name).to eq 'Natal'
  end
end

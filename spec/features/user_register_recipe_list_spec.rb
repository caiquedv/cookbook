require 'rails_helper'

describe 'Usuário cria lista de receitas' do
  it 'com sucesso' do 
    user = create(
      :user, email: 'user@email.com',
      password: '123456', role: :user
    )

    login_as user
    visit root_path
    click_on 'Registrar lista de receitas'
    fill_in 'Nome', with: 'Natal'
    click_on 'Salvar'

    expect(RecipeList.last.name).to eq 'Natal'
  end

  it 'pode acessar listas pelo menu' do 
    user = create(
      :user, email: 'user@email.com',
      password: '123456', role: :user
    )

    create(:recipe_list, name: 'Natal', user: user)

    login_as user
    visit root_path
    click_on 'Listas de receitas'

    expect(page).to have_content 'Natal'
  end

  it 'deve estar autenticado' do 
    
  end
end

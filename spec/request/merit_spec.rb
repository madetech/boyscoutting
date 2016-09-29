RSpec.describe 'Merit', type: :request do
  around(:each) do |example|
    VCR.use_cassette(:merit_api_bot) { example.run }
  end

  let!(:api_key) { create(:user).api_key }

  let(:params) do
    {
      user_name: '@bob',
      text: '@emile',
      api_key: api_key
    }
  end

  it 'creates a merit' do
    post "/api/merits", params: params
    expect(body).to include("#{params[:text]} now has 1 Made Merit(s)!")
  end

  it 'displays a table of results' do
    create_list(:merit, 2, username: '@bob')
    create_list(:merit, 3, username: '@sally')

    post '/api/merits', params: params

    expect(body).to eq("#{params[:text]} now has 1 Made Merit(s)!

  :crown: @sally | 3
   @bob | 2
   @emile | 1

")
  end

  it 'does not allow a user to merit themselves' do
    params[:user_name] ='emile'

    post '/api/merits', params: params

    expect(Merit.count).to eq(0)
    expect(body).to match("You cannot merit yourself! This incident will be reported!")
  end

  it 'displays the results' do
    create_list(:merit, 2, username: '@bob')
    create(:merit, username: '@emile')

    get '/api/merits', params: params

    expect(body).to match("
      :crown: @bob | 2
      @emile | 1")
  end
end

require 'rails_helper'

describe MoviesController do
  describe 'Showing similar movies' do
    it 'calls the model method that finds all similar movies' do
      fake_results = [double('movie1'), double('movie2')]
      expect(Movie).to receive(:find_similar).with("0").
        and_return(fake_results)
      get :similar, id: 0
    end
    it 'selects the Similar Results template for rendering' do
      fake_results = [double('movie1'), double('movie2')]
      allow(Movie).to receive(:find_similar).with('0').
        and_return(fake_results)
      get :similar, id: 0
      expect(response).to render_template(:similar)
    end
    it 'makes the similar search results available to that template' do
      fake_results = [double('movie1'), double('movie2')]
      allow(Movie).to receive(:find_similar).with('0').
        and_return(fake_results)
      get :similar, id: 0
      expect(assigns(:movies)).to eq(fake_results)

    end
  end
end

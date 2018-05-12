describe RougeLines::Lexers::APIBlueprint do
  let(:subject) { RougeLines::Lexers::APIBlueprint.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.apib'
    end
  end
end

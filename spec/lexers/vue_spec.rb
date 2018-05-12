describe RougeLines::Lexers::Vue do
  let(:subject) { RougeLines::Lexers::Vue.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.vue'
    end
  end
end


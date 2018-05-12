# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Nix do
  let(:subject) { RougeLines::Lexers::Nix.new }

  describe 'lexing' do
    include Support::Lexing
  end
end

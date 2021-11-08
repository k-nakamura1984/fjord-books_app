# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'すごくわかりやすい！'
    fill_in 'メモ', with: 'Ruby超入門'
    fill_in '著者', with: 'igaiga'
    click_on '登録する'
    assert_text '本が作成されました。'
    assert_text 'すごくわかりやすい！'
    assert_text 'Ruby超入門'
    assert_text 'igaiga'
    click_on '戻る'
  end

  test 'updating a Book' do
    visit edit_book_url(@book)
    fill_in 'タイトル', with: 'タイトルを編集しました'
    fill_in 'メモ', with: 'メモを編集しました'
    click_on '更新する'
    assert_text '本が更新されました。'
    assert_text 'タイトルを編集しました'
    assert_text 'メモを編集しました'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '本が削除されました。'
  end
end

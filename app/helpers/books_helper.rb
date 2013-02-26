module BooksHelper

  #def get_book_info_from_google(book)
  #  options = {}
  #  options[:v] = "1.0"
  #  options[:q] = "#{book.name}+inauthor:#{book.authors.first.name}"
  #  query_string = options.collect { |key, value| "#{key}=#{value.to_s}" }.join("&")
  #  uri = "http://ajax.googleapis.com/ajax/services/search/books?#{query_string}"
  #  result = JSON.parse(open(uri).read)
  #  if result['responseData']['results'].empty?
  #    google_uri = "https://www.google.com/?q=#{CGI::escape(book.name)}"
  #    link_to 'Find this book online', google_uri, class: 'btn'
  #  else
  #    link_to 'View this book on Google Books', result['responseData']['results'][0]['unescapedUrl'], class: 'btn'
  #  end
  #end
end

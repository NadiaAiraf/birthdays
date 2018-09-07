require 'birthday_list'

describe Birthdays do
  it 'adds a birthday' do
    expect(subject.add_birthday('tom','25','25th December')).to eq([{name:'tom',age:'25',date: '25th December'}])
  end

  it 'adds multiple birthdays' do
    subject.add_birthday('tom','25','1st September')
    subject.add_birthday('aidan','26','July 13th')
    expect(subject.add_birthday('jon','24','August 5th')).to eq([{name:'tom',age:'25',date:'1st September'},{name:'aidan',age:'26',date:'July 13th'},{name:'jon',age:'24',date:'August 5th'}])
  end

  it 'shows a list of all of the names + birthdays' do
    subject.add_birthday('tom','25','1st September')
    subject.add_birthday('aidan','26','July 13th')
    expect(subject.show_birthdays).to eq ("tom 25 1st September\naidan 26 July 13th\n")
  end
end

require 'birthday_list'
require 'birthdaynew'

class BirthdayMock
  def initialize(name,date)
  end

  def pass_hash
    { name: 'Guy Fawkes', birthday: "13 April 1570" }
  end
end

RSpec.describe BirthdayList do
  # add my friends’ birthdays

  it 'adds a birthday' do
    birthday_list = BirthdayList.new(BirthdayMock)
    expect(birthday_list.add('Guy Fawkes', "13 April 1570")).to eq [{name: 'Guy Fawkes', birthday: "13 April 1570"}]
  end

  it 'adds two birthdays' do
    birthday_list = BirthdayList.new(BirthdayMock)
    birthday_list.add('Guy Fawkes', "13 April 1570")

    expect(birthday_list.add('Guy Fawkes', "13 April 1570")).to eq [{name: 'Guy Fawkes', birthday: "13 April 1570"}, {name: 'Guy Fawkes', birthday: "13 April 1570"}]
  end

  # see them all there with their names

  xit 'shows all the birthdays' do
    birthday_list = BirthdayList.new
    birthday_list.add('Guy Fawkes', "13 April 1570")
    birthday_list.add('Julie Andrews', "1 October 1935")

    expect { birthday_list.show }.to output("Guy Fawkes: 13 April 1570\nJulie Andrews: 1 October 1935\n").to_stdout
  end

   # Check who’s birthday it is today

   xit 'checks birthdays for a birthday today' do
     Timecop.freeze(Time.parse('1 October 2018')) do

       birthday_list = BirthdayList.new
       birthday_list.add('Guy Fawkes', "13 April 1570")
       birthday_list.add('Julie Andrews', "1 October 1935")

       expect { birthday_list.check }.to output("It's Julie Andrews's birthday today! They are 83 years old!\n").to_stdout
     end
   end

   xit 'checks birthdays for a birthday - but there are none' do
     birthday_list = BirthdayList.new
     birthday_list.add('Guy Fawkes', "13 April 1570")
     birthday_list.add('Julie Andrews', "1 October 1935")

     expect { birthday_list.check }.not_to output().to_stdout
   end
end

import pymysql
import flask
from array import array
import mysql.connector

# functions
def create(substage = 0, user = ''):
#     print(substage)
    if int(substage) == 1:
        print('Create your review for a book')
        book_title = input('Please enter book title')
        review = input('Please enter the review')
        try:
            c1.execute('CALL createReview(\'{}\',\'{}\',\'{}\')'.format(book_title,user,review))
        except:
            print('Not a book')
        
    elif int(substage) == 2:
        print('Add motion media to a book')
        book_title = input('Please enter book title you would like to add motion media to')
        actors = input('Please list main actors in one line i.e. John Smith, Jane Doe...')
        try:
            c1.execute('CALL createMotionMedia(\'{}\',\'{}\')'.format(book_title,actors))
        except:
            print('Not a book')
    elif int(substage) == 3:
        print(substage)
    else:
        print('Not a command! back to main menu for you')
def read(substage = 0, user = ''):
#     print(substage)
    if int(substage) == 1:
        print('List all books in database')
        c1.execute('SELECT title,length FROM book;')
        bl = c1.fetchall()
        for b in bl:
            print(b['title'] + ' : '+str(b['length']) + ' pages')
    elif int(substage) == 2:
        print('Get a Summary')
        book_title = input("Please input the book's title you would like a summary for, only the title please")
        try:
            c1.execute('CALL getSummary(\'{}\')'.format(book_title))
            print('SUMMARY: '+c1.fetchall()[0]['summary'])
        except:
            print('Not a book')
    elif int(substage) == 3:
        print("See reviews by a particular user")
        arg = input('Please enter the username that you would like to see reviews by')
        try:
            c1.execute('CALL getReviewsBy(\'{}\')'.format(arg))
            review_dict = c1.fetchall()

            for d in review_dict:
                print(d['title'])
                print(d['review_summary'])
                print()
        except:
            print('Not a user')
    elif int(substage) == 4:
        print('See Top Five Book List')
        try:
            c1.execute('CALL getTopFive()')
            review_dict = c1.fetchall()

            for d in review_dict:
                print(d['title'])
                print('Average Rating: '+str(d['Average_Rating']))
                print()
        except:
            print('I Dont know what you did but it wasnt right')
    elif int(substage) == 5:
        print("Get list of books by author")
        author = input('Please enter author name')
        c1.execute('CALL getAllBooksByAuthor(\'{}\')'.format(author))
        bl = c1.fetchall()
        for b in bl:
            print(b['title'])
            print()
    else:
        print('Not a command! back to main menu for you')
def update(substage = 0, user = ''):
#     print("THIS IS TEST"+substage)
    if int(substage) == 1:
        print('Update a rating you gave a book')
        try:
            arg = input('Please enter the title of the book')
            nr = input('Please enter the new rating you wish to give')
            c1.execute('CALL updateRating(\'{}\',\'{}\',\'{}\')'.format(arg,float(nr),'g_sarin'))
        except:
            print('you messed up, its definitely not the code')
    elif int(substage) == 2:
        print('Change your favorite book')
        book_title = input('Enter title that you want to make your favorite book, must be in database')
        try:
            c1.execute('CALL updateFavBook(\'{}\',\'{}\')'.format(book_title,user))
            c1.fetchall()
            print('Changed!')
        except:
            print('Not a book')
    else:
        print('Not a command! back to main menu for you')
        
def delete(substage = 0, user = ''):
#     print(substage)
    if int(substage) == 1:
        print('Delete your review')
        book_title = input('Input title of book that you want to delete review of, you must have a review for it')
        try:
            c1.execute('CALL deleteReview(\'{}\',\'{}\')'.format(book_title,user))
            print('Deleted!')
        except:
            print('Not a book')
    elif int(substage) == 2:
        print('Delete the motion media associated with a book')
        book_title = input('Input title of book that you want to delete motion media of, there must be motion media for it')
        try:
            c1.execute('CALL deleteMotionMedia(\'{}\')'.format(book_title))
            print('Deleted!')
        except:
            print('Not a book')
    else:
        print('Not a command! back to main menu for you')



sql_user = input('Enter Your MySQL Username: ')
print(sql_user)
sql_pass = input('Enter Your MySQL Password: ')
print(sql_pass)

try:
    cnx = pymysql.connect(host='localhost',user='{}'.format(sql_user), password='{}'.format(sql_pass),
    db='bookreviewdatabase', charset ='utf8mb4',cursorclass=pymysql.cursors.DictCursor)
except pymysql.err.InternalError as e:
    code, msg = e.args
    if code == 1050:
        print(msg)
    if code == 1045:
        print(msg)

# make connection
c1 = cnx.cursor()

stage = 1

# ask if sign up or log in

if stage == 1:
    inp =  input("Would you like to sign up or log in? (please reply with \"log in\" or \"sign up\")" )

    # send to user creation stage
    if inp == 'sign up':
        stage = stage + 1
    # send to log in stage
    if inp == 'log in':
        stage = stage + 2

if stage == 2:
    user = input("Please Enter Your Username: ")
    pas = input("Please Enter Your Password: ")
    name = input("Please Enter Your Name: ")
    age = input("Please Enter Your age: ")

    # create user with those items
    c1.callproc('addUser',user,pas,name,int(age))
    print('You created an account!')

    # send to verify they are in the database
    print('Now please re-enter your information')
    stage = stage + 1

if stage == 3:
    username = input("Please Enter Your Username: ")
#     print('here!')
    password = input("Please Enter Your Password: ")

    c1.callproc('checkUser',(username,password))
    account = c1.fetchall()[0]['COUNT(*)'] #pulls 1/0 depending on if in user table
    if account:
        stage = stage + 1
        loggedin = True
    else:
        print('You are not in the database, goodbye')
        stage = 9

sub_stage = 1
operator = ''

while loggedin:
    if stage == 4:
        print('Welcome to main terminal')
        print('The options are listed as thus')
        print('1. You can enter the create menu')
        print('2. You can enter the read menu')
        print('3. You can enter the update menu')
        print('4. You can enter the delete menu')
        print('5. You can exit the database')

        ui = input("Please enter the number of the option you would like: ")
        stage = stage + int(ui)

    if stage == 5:
        # create 
        operator = 'create'
        print(operator)
        print('The {} options are listed as thus'.format(operator))
        print('1. Create a review for a book')
        print('2. Create motion media for a book')
        substage = input("Please enter the number of the option you would like: ")
        create(substage,username)
        stage = 4

    if stage == 6:
        # read 
        operator = 'read'
        print(operator)
        print('The {} options are listed as thus'.format(operator))
        print('1. Get all books in the database')
        print('2. Get a book summary')
        print('3. Get reviews by a user')
        print('4. Get Top Five List based on ratings')
        print('5. Get list of books by author')
        substage = input("Please enter the number of the option you would like: ")
        read(substage,username)
        stage = 4

    if stage == 7:
        # update 
        operator = 'update'
        print(operator)
        print('The {} options are listed as thus'.format(operator))
        print('1. You can update a rating you gave a book')
        print('2. You can update your favorite book ')
        substage = input("Please enter the number of the option you would like: ")
        update(substage,username)
        stage = 4

    if stage == 8:
        #delete 
        operator = 'delete'
        print(operator)
        print('The {} options are listed as thus'.format(operator))
        print('1. Delete one of your reviews')
        print('2. Delete the motion media for a book')
        substage = input("Please enter the number of the option you would like: ")
        delete(substage,username)
        stage = 4


    if stage == 9:
        # exit loop
        loggedin = False
        print('done')
        cnx.commit()
        cnx.close()
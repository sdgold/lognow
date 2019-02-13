Lognow
=========
---

Requirements
------------

### Ruby and Rails

Paperclip now requires Ruby version **>= 2.1** and Rails version **>= 4.2**

---

Quick Start
-----------

Create a file that will hold the events you would like to log.  

You can store this directly in your `/lib` folder and ensure this file is required.  Altneratively, you can also have this file loaded through `application.rb` inside your config block.

**# /lib/app_events.rb**

    module AppEvents
      TYPES = {
        ADD_BOOK: 'Add User',
        DELETE_BOOK: 'Delete Book,
        SEND_EMAIL: 'Send Email
      }
    end
  

**Usage**

From here, you can now utilize Lognow anywhere in your code. Below provides an example of how Lognow can be used in a `users_controller.rb`

    def destroy
      ...
      if @user.destroy
        Lognow.print true, :REMOVE_USER, user_hash, {message: "successfully destroyed user"}
      end
      ...
    end
  

**You can view your log to see the following has been written to the corresponding environment.log file.**

    {
      "status": true,
      "timestamp": "2019-02-13T11:50:53.335-08:00",
      "event": "Remove User",
      "data": {
        "id": 10,
        "created_at": "2019-01-31T03:15:05.073Z",
        "updated_at": "2019-01-31T03:15:05.073Z",
        "first_name": "John",
        "last_name": "Smith",
        "email": "example@example.com.com"
        ...
      },
      "error": {
        "message": "successfully destroyed user"
      }
    }


License
-------

Lognow is Copyright © 2019.  It is free software, and may be
redistributed.
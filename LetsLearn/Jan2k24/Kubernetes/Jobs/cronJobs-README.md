Cron is a time-based job scheduler in Unix-like operating systems, including Linux and macOS. It allows users to schedule tasks or scripts to run periodically at fixed intervals, such as every minute, hour, day, week, or month. These scheduled tasks are referred to as "cron jobs." 

Cron jobs are defined in a crontab file, which is a simple text file that contains instructions for the cron daemon on when and how to execute certain commands or scripts. Each user on a system can have their own crontab file, and system-wide cron jobs are typically stored in the /etc/crontab file.

Here's a basic crontab syntax:

```
* * * * * command_to_execute
- - - - -
| | | | |
| | | | +---- Day of the week (0 - 7) (Sunday is 0 or 7, Monday is 1, and so on)
| | | +------ Month (1 - 12)
| | +-------- Day of the month (1 - 31)
| +---------- Hour (0 - 23)
+------------ Minute (0 - 59)
```

Here are some examples of cron jobs:

1. Run a script every 30 minutes:
   ```
   */30 * * * * /path/to/script.sh
   ```

2. Execute a command at 2:00 AM every day:
   ```
   0 2 * * * /path/to/command
   ```

3. Run a script every Monday at 8:00 AM:
   ```
   0 8 * * 1 /path/to/script.sh
   ```

4. Perform a backup every Sunday at midnight:
   ```
   0 0 * * 0 /path/to/backup_script.sh
   ```

5. Send a reminder email on the first day of every month:
   ```
   0 0 1 * * /path/to/send_email_script.sh
   ```

To edit your crontab file, you can use the `crontab -e` command, which opens the file in your default text editor. Remember that cron uses the system time, so ensure your system time is correctly configured.


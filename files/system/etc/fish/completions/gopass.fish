#!/usr/bin/env fish
set PROG 'gopass'

function __fish_gopass_needs_command
  set -l cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = $PROG ]
    return 0
  end
  return 1
end

function __fish_gopass_uses_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_gopass_print_gpg_keys
  gpg2 --list-keys | grep uid | sed 's/.*&lt;\(.*\)>/\1/'
end

function __fish_gopass_print_entries
  gopass ls --flat
end

function __fish_gopass_print_dir
  for i in (gopass ls --flat)
	  echo (dirname $i)
	end | sort -u
end

# erase any existing completions for gopass
complete -c $PROG -e
complete -c $PROG -f -n '__fish_gopass_needs_command' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -s c -l clip -r -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a age -d 'Command: age commands'
complete -c $PROG -f -n '__fish_gopass_uses_command age' -a identities -d 'Subcommand: List identities'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command age identities -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a alias -d 'Command: Print domain aliases'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a audit -d 'Command: Decrypt all secrets and scan for weak or leaked passwords'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a cat -d 'Command: Decode and print content of a binary secret to stdout, or encode and insert from stdin'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a clone -d 'Command: Clone a password store from a git repository'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a completion -d 'Command: Bash and ZSH completion'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a bash -d 'Subcommand: Source for auto completion in bash'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion bash -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a zsh -d 'Subcommand: Source for auto completion in zsh'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion zsh -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a fish -d 'Subcommand: Source for auto completion in fish'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion fish -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a openbsdksh -d 'Subcommand: Source for auto completion in OpenBSD&#39;s ksh'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion openbsdksh -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion' -a help -d 'Subcommand: Shows a list of commands or help for one command'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command completion help -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a config -d 'Command: Display and edit the configuration file'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a convert -d 'Command: Convert a store to different backends'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a copy -d 'Command: Copy secrets from one location to another'
complete -c $PROG -f -n '__fish_gopass_uses_command copy' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a create -d 'Command: Easy creation of new secrets'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a delete -d 'Command: Remove one or many secrets from the store'
complete -c $PROG -f -n '__fish_gopass_uses_command delete' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a edit -d 'Command: Edit new or existing secrets'
complete -c $PROG -f -n '__fish_gopass_uses_command edit' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a env -d 'Command: Run a subprocess with a pre-populated environment'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a find -d 'Command: Search for secrets'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a fsck -d 'Command: Check store integrity, clean up artifacts and possibly re-write secrets'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a fscopy -d 'Command: Copy files from or to the password store'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a fsmove -d 'Command: Move files from or to the password store'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a generate -d 'Command: Generate a new password'
complete -c $PROG -f -n '__fish_gopass_uses_command generate' -a "(__fish_gopass_print_dir)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a git -d 'Command: Run a git command inside a password store: gopass git [--store=&lt;store&gt;] &lt;git-command&gt;'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a grep -d 'Command: Search for secrets files containing search-string when decrypted.'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a history -d 'Command: Show password history'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a init -d 'Command: Initialize new password store.'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a insert -d 'Command: Insert a new secret'
complete -c $PROG -f -n '__fish_gopass_uses_command insert' -a "(__fish_gopass_print_dir)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a link -d 'Command: Create a symlink'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a list -d 'Command: List existing secrets'
complete -c $PROG -f -n '__fish_gopass_uses_command list' -a "(__fish_gopass_print_dir)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a merge -d 'Command: Merge multiple secrets into one'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a mounts -d 'Command: Edit mounted stores'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts' -a add -d 'Subcommand: Mount a password store'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l create -d "Create a new store at this location"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts add -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts' -a remove -d 'Subcommand: Umount an mounted password store'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts remove -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts' -a versions -d 'Subcommand: Display mount provider versions'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command mounts versions -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a move -d 'Command: Move secrets from one location to another'
complete -c $PROG -f -n '__fish_gopass_uses_command move' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a otp -d 'Command: Generate time- or hmac-based tokens'
complete -c $PROG -f -n '__fish_gopass_uses_command otp' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a process -d 'Command: Process a template file'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a pwgen -d 'Command: Generate passwords'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a rcs -d 'Command: Run a RCS command inside a password store'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs' -a init -d 'Subcommand: Init RCS repo'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l name -d "Git Author Name"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l email -d "Git Author Email"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l storage -d "Select storage backend [fossilfs gitfs]"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs init -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs' -a status -d 'Subcommand: RCS status'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command rcs status -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a recipients -d 'Command: Edit recipient permissions'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients' -a ack -d 'Subcommand: Update recipients.hash'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients ack -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients' -a add -d 'Subcommand: Add any number of Recipients to any store'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l force -d "Force adding non-existing keys"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients add -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients' -a remove -d 'Subcommand: Remove any number of Recipients from any store'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l store -d "Store to operate on"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l force -d "Force adding non-existing keys"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command recipients remove -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a setup -d 'Command: Initialize a new password store'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a show -d 'Command: Display the content of a secret'
complete -c $PROG -f -n '__fish_gopass_uses_command show' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -n '__fish_gopass_needs_command' -a sum -d 'Command: Compute the SHA256 checksum'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a sync -d 'Command: Sync all local stores with their remotes'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a templates -d 'Command: Edit templates'
complete -c $PROG -f -n '__fish_gopass_uses_command templates' -a show -d 'Subcommand: Show a secret template.'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates show -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates' -a edit -d 'Subcommand: Edit secret templates.'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates edit -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates' -a remove -d 'Subcommand: Remove secret templates.'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l yes -d "Always answer yes to yes/no questions"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l clip -d "Copy the password value into the clipboard"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l alsoclip -d "Copy the password and show everything"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l qr -d "Print the password as a QR Code"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l unsafe -d "Display unsafe content (e.g. the password) even if safecontent is enabled"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l password -d "Display only the password. Takes precedence over all other flags."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l revision -d "Show a past revision. Does NOT support RCS specific shortcuts. Use exact revision or -&lt;N&gt; to select the Nth oldest revision of this entry."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l noparsing -d "Do not parse the output."'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l nosync -d "Disable auto-sync"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l chars -d "Print specific characters from the secret"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l help -d "show help"'
complete -c $PROG -f -n '__fish_gopass_uses_command templates remove -l version -d "print the version"'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a unclip -d 'Command: Internal command to clear clipboard'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a update -d 'Command: Check for updates'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a version -d 'Command: Display version'
complete -c $PROG -f -n '__fish_gopass_needs_command' -a help -d 'Command: Shows a list of commands or help for one command'

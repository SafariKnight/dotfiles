# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_jj_global_optspecs
    string join \n R/repository= ignore-working-copy ignore-immutable at-operation= debug color= quiet no-pager config= config-toml= config-file= h/help V/version
end

function __fish_jj_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_jj_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_jj_using_subcommand
    set -l cmd (__fish_jj_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c jj -n __fish_jj_needs_command -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n __fish_jj_needs_command -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n __fish_jj_needs_command -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n __fish_jj_needs_command -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n __fish_jj_needs_command -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n __fish_jj_needs_command -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n __fish_jj_needs_command -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n __fish_jj_needs_command -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n __fish_jj_needs_command -l debug -d 'Enable debug logging'
complete -c jj -n __fish_jj_needs_command -l quiet -d 'Silence non-primary command output'
complete -c jj -n __fish_jj_needs_command -l no-pager -d 'Disable the pager'
complete -c jj -n __fish_jj_needs_command -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n __fish_jj_needs_command -s V -l version -d 'Print version'
complete -c jj -n __fish_jj_needs_command -f -a abandon -d 'Abandon a revision'
complete -c jj -n __fish_jj_needs_command -f -a absorb -d 'Move changes from a revision into the stack of mutable revisions'
complete -c jj -n __fish_jj_needs_command -f -a backout -d 'Apply the reverse of given revisions on top of another revision'
complete -c jj -n __fish_jj_needs_command -f -a bookmark -d 'Manage bookmarks [default alias: b]'
complete -c jj -n __fish_jj_needs_command -f -a branch -d 'Manage bookmarks [default alias: b]'
complete -c jj -n __fish_jj_needs_command -f -a commit -d 'Update the description and create a new change on top'
complete -c jj -n __fish_jj_needs_command -f -a config -d 'Manage config options'
complete -c jj -n __fish_jj_needs_command -f -a debug -d 'Low-level commands not intended for users'
complete -c jj -n __fish_jj_needs_command -f -a describe -d 'Update the change description or other metadata'
complete -c jj -n __fish_jj_needs_command -f -a desc -d 'Update the change description or other metadata'
complete -c jj -n __fish_jj_needs_command -f -a diff -d 'Compare file contents between two revisions'
complete -c jj -n __fish_jj_needs_command -f -a diffedit -d 'Touch up the content changes in a revision with a diff editor'
complete -c jj -n __fish_jj_needs_command -f -a duplicate -d 'Create new changes with the same content as existing ones'
complete -c jj -n __fish_jj_needs_command -f -a edit -d 'Sets the specified revision as the working-copy revision'
complete -c jj -n __fish_jj_needs_command -f -a evolog -d 'Show how a change has evolved over time'
complete -c jj -n __fish_jj_needs_command -f -a evolution-log -d 'Show how a change has evolved over time'
complete -c jj -n __fish_jj_needs_command -f -a file -d 'File operations'
complete -c jj -n __fish_jj_needs_command -f -a fix -d 'Update files with formatting fixes or other changes'
complete -c jj -n __fish_jj_needs_command -f -a git -d 'Commands for working with Git remotes and the underlying Git repo'
complete -c jj -n __fish_jj_needs_command -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c jj -n __fish_jj_needs_command -f -a interdiff -d 'Compare the changes of two commits'
complete -c jj -n __fish_jj_needs_command -f -a log -d 'Show revision history'
complete -c jj -n __fish_jj_needs_command -f -a new -d 'Create a new, empty change and (by default) edit it in the working copy'
complete -c jj -n __fish_jj_needs_command -f -a next -d 'Move the working-copy commit to the child revision'
complete -c jj -n __fish_jj_needs_command -f -a operation -d 'Commands for working with the operation log'
complete -c jj -n __fish_jj_needs_command -f -a op -d 'Commands for working with the operation log'
complete -c jj -n __fish_jj_needs_command -f -a parallelize -d 'Parallelize revisions by making them siblings'
complete -c jj -n __fish_jj_needs_command -f -a prev -d 'Change the working copy revision relative to the parent revision'
complete -c jj -n __fish_jj_needs_command -f -a rebase -d 'Move revisions to different parent(s)'
complete -c jj -n __fish_jj_needs_command -f -a resolve -d 'Resolve conflicted files with an external merge tool'
complete -c jj -n __fish_jj_needs_command -f -a restore -d 'Restore paths from another revision'
complete -c jj -n __fish_jj_needs_command -f -a revert -d 'Apply the reverse of the given revision(s)'
complete -c jj -n __fish_jj_needs_command -f -a root -d 'Show the current workspace root directory (shortcut for `jj workspace root`)'
complete -c jj -n __fish_jj_needs_command -f -a run -d '(**Stub**, does not work yet) Run a command across a set of revisions.'
complete -c jj -n __fish_jj_needs_command -f -a show -d 'Show commit description and changes in a revision'
complete -c jj -n __fish_jj_needs_command -f -a sign -d 'Cryptographically sign a revision'
complete -c jj -n __fish_jj_needs_command -f -a simplify-parents -d 'Simplify parent edges for the specified revision(s)'
complete -c jj -n __fish_jj_needs_command -f -a sparse -d 'Manage which paths from the working-copy commit are present in the working copy'
complete -c jj -n __fish_jj_needs_command -f -a split -d 'Split a revision in two'
complete -c jj -n __fish_jj_needs_command -f -a squash -d 'Move changes from a revision into another revision'
complete -c jj -n __fish_jj_needs_command -f -a status -d 'Show high-level repo status'
complete -c jj -n __fish_jj_needs_command -f -a st -d 'Show high-level repo status'
complete -c jj -n __fish_jj_needs_command -f -a tag -d 'Manage tags'
complete -c jj -n __fish_jj_needs_command -f -a util -d 'Infrequently used commands such as for generating shell completions'
complete -c jj -n __fish_jj_needs_command -f -a undo -d 'Undo an operation (shortcut for `jj op undo`)'
complete -c jj -n __fish_jj_needs_command -f -a unsign -d 'Drop a cryptographic signature'
complete -c jj -n __fish_jj_needs_command -f -a version -d 'Display version information'
complete -c jj -n __fish_jj_needs_command -f -a workspace -d 'Commands for working with workspaces'
complete -c jj -n "__fish_jj_using_subcommand abandon" -s r -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand abandon" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand abandon" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand abandon" -s s -l summary
complete -c jj -n "__fish_jj_using_subcommand abandon" -l retain-bookmarks -d 'Do not delete bookmarks pointing to the revisions to abandon'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l restore-descendants -d 'Do not modify the content of the children of the abandoned commits'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand abandon" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand absorb" -s f -l from -d 'Source revision to absorb from' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -s t -l into -l to -d 'Destination revisions to absorb into' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand absorb" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand absorb" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand absorb" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand absorb" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand backout" -s r -l revisions -d 'The revision(s) to apply the reverse of' -r
complete -c jj -n "__fish_jj_using_subcommand backout" -s d -l destination -d 'The revision to apply the reverse changes on top of' -r
complete -c jj -n "__fish_jj_using_subcommand backout" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand backout" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand backout" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand backout" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand backout" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand backout" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand backout" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand backout" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand backout" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand backout" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand backout" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand backout" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a create -d 'Create a new bookmark'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a c -d 'Create a new bookmark'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a delete -d 'Delete an existing bookmark and propagate the deletion to remotes on the next push'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a d -d 'Delete an existing bookmark and propagate the deletion to remotes on the next push'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a forget -d 'Forget a bookmark without marking it as a deletion to be pushed'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a f -d 'Forget a bookmark without marking it as a deletion to be pushed'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a list -d 'List bookmarks and their targets'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a l -d 'List bookmarks and their targets'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a move -d 'Move existing bookmarks to target revision'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a m -d 'Move existing bookmarks to target revision'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a rename -d 'Rename `old` bookmark name to `new` bookmark name'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a r -d 'Rename `old` bookmark name to `new` bookmark name'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a set -d 'Create or update a bookmark to point to a certain commit'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a s -d 'Create or update a bookmark to point to a certain commit'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a track -d 'Start tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a t -d 'Start tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a untrack -d 'Stop tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l include-remotes -d 'When forgetting a local bookmark, also forget any corresponding remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l include-remotes -d 'When forgetting a local bookmark, also forget any corresponding remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l remote -d 'Show all tracking and non-tracking remote bookmarks belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s r -l revisions -d 'Show bookmarks whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each bookmark using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l sort -d 'Sort bookmarks based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s a -l all-remotes -d 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s t -l tracked -d 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s c -l conflicted -d 'Show conflicted bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l remote -d 'Show all tracking and non-tracking remote bookmarks belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s r -l revisions -d 'Show bookmarks whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each bookmark using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l sort -d 'Sort bookmarks based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s a -l all-remotes -d 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s t -l tracked -d 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s c -l conflicted -d 'Show conflicted bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s f -l from -d 'Move bookmarks from the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s B -l allow-backwards -d 'Allow moving bookmarks backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s f -l from -d 'Move bookmarks from the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s B -l allow-backwards -d 'Allow moving bookmarks backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s B -l allow-backwards -d 'Allow moving the bookmark backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s B -l allow-backwards -d 'Allow moving the bookmark backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a create -d 'Create a new bookmark'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a c -d 'Create a new bookmark'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a delete -d 'Delete an existing bookmark and propagate the deletion to remotes on the next push'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a d -d 'Delete an existing bookmark and propagate the deletion to remotes on the next push'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a forget -d 'Forget a bookmark without marking it as a deletion to be pushed'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a f -d 'Forget a bookmark without marking it as a deletion to be pushed'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a list -d 'List bookmarks and their targets'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a l -d 'List bookmarks and their targets'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a move -d 'Move existing bookmarks to target revision'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a m -d 'Move existing bookmarks to target revision'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a rename -d 'Rename `old` bookmark name to `new` bookmark name'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a r -d 'Rename `old` bookmark name to `new` bookmark name'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a set -d 'Create or update a bookmark to point to a certain commit'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a s -d 'Create or update a bookmark to point to a certain commit'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a track -d 'Start tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a t -d 'Start tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand branch; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a untrack -d 'Stop tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from c" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from d" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l include-remotes -d 'When forgetting a local bookmark, also forget any corresponding remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from forget" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l include-remotes -d 'When forgetting a local bookmark, also forget any corresponding remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l remote -d 'Show all tracking and non-tracking remote bookmarks belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -s r -l revisions -d 'Show bookmarks whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each bookmark using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l sort -d 'Sort bookmarks based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -s a -l all-remotes -d 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -s t -l tracked -d 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -s c -l conflicted -d 'Show conflicted bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l remote -d 'Show all tracking and non-tracking remote bookmarks belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -s r -l revisions -d 'Show bookmarks whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each bookmark using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l sort -d 'Sort bookmarks based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -s a -l all-remotes -d 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -s t -l tracked -d 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -s c -l conflicted -d 'Show conflicted bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -s f -l from -d 'Move bookmarks from the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -s B -l allow-backwards -d 'Allow moving bookmarks backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -s f -l from -d 'Move bookmarks from the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -s B -l allow-backwards -d 'Allow moving bookmarks backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from m" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -s B -l allow-backwards -d 'Allow moving the bookmark backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -s B -l allow-backwards -d 'Allow moving the bookmark backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from track" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from t" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand branch; and __fish_seen_subcommand_from untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand commit" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -s m -l message -d 'The change description to use (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -l author -d 'Set author to the provided string' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand commit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand commit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand commit" -s i -l interactive -d 'Interactively choose which changes to include in the first commit'
complete -c jj -n "__fish_jj_using_subcommand commit" -l reset-author -d 'Reset the author to the configured user'
complete -c jj -n "__fish_jj_using_subcommand commit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand commit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand commit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand commit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand commit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand commit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a edit -d 'Start an editor on a jj config file'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a e -d 'Start an editor on a jj config file'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a get -d 'Get the value of a given config option.'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a g -d 'Get the value of a given config option.'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a list -d 'List variables set in config files, along with their values'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a l -d 'List variables set in config files, along with their values'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a path -d 'Print the paths to the config files'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a p -d 'Print the paths to the config files'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a set -d 'Update a config file to set the given option to a given value'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a s -d 'Update a config file to set the given option to a given value'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a unset -d 'Update a config file to unset the given option'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a u -d 'Update a config file to unset the given option'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each variable using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l include-defaults -d 'Whether to explicitly include built-in default values in the list'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l include-overridden -d 'Allow printing overridden values'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each variable using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l include-defaults -d 'Whether to explicitly include built-in default values in the list'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l include-overridden -d 'Allow printing overridden values'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a copy-detection -d 'Show information about file copies detected'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a fileset -d 'Parse fileset expression'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a index -d 'Show commit index stats'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a init-simple -d 'Create a new repo in the given directory using the proof-of-concept simple backend'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a local-working-copy -d 'Show information about the local working copy state'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a operation -d 'Show information about an operation and its view'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a view -d 'Show information about an operation and its view'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a reindex -d 'Rebuild commit index'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a revset -d 'Evaluate revset to full commit IDs'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a snapshot -d 'Trigger a snapshot in the op log'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a template -d 'Parse a template'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a tree -d 'List the recursive entries of a tree'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a watchman
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a working-copy -d 'Show information about the working copy state'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l display -r -f -a "operation\t'Show only the operation details'
id\t'Show the operation id only'
view\t'Show only the view details'
all\t'Show both the view and the operation'"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l display -r -f -a "operation\t'Show only the operation details'
id\t'Show the operation id only'
view\t'Show only the view details'
all\t'Show both the view and the operation'"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s r -l revision -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l id -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l dir -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a status -d 'Check whether `watchman` is enabled and whether it\'s correctly installed'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a query-clock
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a query-changed-files
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a reset-clock
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand describe" -s r -r
complete -c jj -n "__fish_jj_using_subcommand describe" -s m -l message -d 'The change description to use (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l author -d 'Set author to the provided string' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand describe" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand describe" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand describe" -l stdin -d 'Read the change description from stdin'
complete -c jj -n "__fish_jj_using_subcommand describe" -l no-edit -d 'Don\'t open an editor'
complete -c jj -n "__fish_jj_using_subcommand describe" -l edit -d 'Open an editor'
complete -c jj -n "__fish_jj_using_subcommand describe" -l reset-author -d 'Reset the author to the configured user'
complete -c jj -n "__fish_jj_using_subcommand describe" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand describe" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand describe" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand describe" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand describe" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand describe" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand desc" -s r -r
complete -c jj -n "__fish_jj_using_subcommand desc" -s m -l message -d 'The change description to use (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -l author -d 'Set author to the provided string' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand desc" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand desc" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand desc" -l stdin -d 'Read the change description from stdin'
complete -c jj -n "__fish_jj_using_subcommand desc" -l no-edit -d 'Don\'t open an editor'
complete -c jj -n "__fish_jj_using_subcommand desc" -l edit -d 'Open an editor'
complete -c jj -n "__fish_jj_using_subcommand desc" -l reset-author -d 'Reset the author to the configured user'
complete -c jj -n "__fish_jj_using_subcommand desc" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand desc" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand desc" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand desc" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand desc" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand desc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand diff" -s r -l revisions -d 'Show changes in these revisions' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -s f -l from -d 'Show changes from this revision' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -s t -l to -d 'Show changes to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand diff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand diff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand diff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand diff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand diff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand diff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand diff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand diff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand diff" -s w -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand diff" -s b -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand diff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand diff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand diff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand diff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand diff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s r -l revision -d 'The revision to touch up' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s f -l from -d 'Show changes from this revision' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s t -l to -d 'Edit changes in this revision' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l tool -d 'Specify diff editor to be used' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l restore-descendants -d 'Preserve the content (not the diff) when rebasing descendants'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s r -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s d -l destination -d 'The revision(s) to duplicate onto (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s A -l insert-after -l after -d 'The revision(s) to insert after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s B -l insert-before -l before -d 'The revision(s) to insert before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand edit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand edit" -s r -d 'Ignored (but lets you pass `-r` for consistency with other commands)'
complete -c jj -n "__fish_jj_using_subcommand edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s r -l revision -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s n -l limit -d 'Limit number of revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand evolog" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand evolog" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand evolog" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l no-graph -d 'Don\'t show the graph, show a flat list of revisions'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s p -l patch -d 'Show patch compared to the previous version of this change'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s r -l revision -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s n -l limit -d 'Limit number of revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l no-graph -d 'Don\'t show the graph, show a flat list of revisions'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s p -l patch -d 'Show patch compared to the previous version of this change'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a annotate -d 'Show the source change for each line of the target file'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a chmod -d 'Sets or removes the executable bit for paths in the repo'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a list -d 'List files in a revision'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a show -d 'Print contents of files in a revision'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a track -d 'Start tracking specified paths in the working copy'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a untrack -d 'Stop tracking specified paths in the working copy'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s r -l revision -d 'an optional revision to start at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s T -l template -d 'Render each line using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s r -l revision -d 'The revision to update' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s r -l revision -d 'The revision to list files in' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each file entry using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s r -l revision -d 'The revision to get the file contents from' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand fix" -s s -l source -d 'Fix files in the specified revision(s) and their descendants. If no revisions are specified, this defaults to the `revsets.fix` setting, or `reachable(@, mutable())` if it is not set' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand fix" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand fix" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand fix" -l include-unchanged-files -d 'Fix unchanged files in addition to changed ones. If no paths are specified, all files in the repo will be fixed'
complete -c jj -n "__fish_jj_using_subcommand fix" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand fix" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand fix" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand fix" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand fix" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand fix" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a clone -d 'Create a new repo backed by a clone of a Git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a export -d 'Update the underlying Git repo with changes made in the repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a fetch -d 'Fetch from a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a import -d 'Update repo with changes made in the underlying Git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a init -d 'Create a new Git backed repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a push -d 'Push to a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a remote -d 'Manage Git remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a root -d 'Show the underlying Git directory of a repository using the Git backend'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l remote -d 'Name of the newly created remote' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l depth -d 'Create a shallow clone of the given depth' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l colocate -d 'Whether or not to colocate the Jujutsu repo with the git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s b -l branch -d 'Fetch only some of the branches' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l remote -d 'The remote to fetch from (only named remotes are supported, can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l all-remotes -d 'Fetch from all remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l git-repo -d 'Specifies a path to an **existing** git repository to be used as the backing git repo for the newly created `jj` repo' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l colocate -d 'Specifies that the `jj` repo should also be a valid `git` repo, allowing the use of both `jj` and `git` commands in the same directory'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l remote -d 'The remote to push to (only named remotes are supported)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s b -l bookmark -d 'Push only this bookmark, or bookmarks matching a pattern (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s r -l revisions -d 'Push bookmarks pointing to these commits (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s c -l change -d 'Push this commit by creating a bookmark based on its change ID (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l named -d 'Specify a new bookmark name and a revision to push under that name, e.g. \'--named myfeature=@\'' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l all -d 'Push all bookmarks (including new bookmarks)'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l tracked -d 'Push all tracked bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l deleted -d 'Push all deleted bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s N -l allow-new -d 'Allow pushing new bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l allow-empty-description -d 'Allow pushing commits with empty descriptions'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l allow-private -d 'Allow pushing commits that are private'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l dry-run -d 'Only display what will change on the remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a add -d 'Add a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a list -d 'List Git remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a remove -d 'Remove a Git remote and forget its bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a rename -d 'Rename a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a set-url -d 'Set the URL of a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand help" -s k -l keyword -d 'Show help for keywords instead of commands' -r -f -a "bookmarks\t'Named pointers to revisions (similar to Git\'s branches)'
config\t'How and where to set configuration options'
filesets\t'A functional language for selecting a set of files'
glossary\t'Definitions of various terms'
revsets\t'A functional language for selecting a set of revision'
templates\t'A functional language to customize command output'
tutorial\t'Show a tutorial to get started with jj'"
complete -c jj -n "__fish_jj_using_subcommand help" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand help" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand help" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand help" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand help" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand help" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand help" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand help" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand help" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand help" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand help" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s f -l from -d 'Show changes from this revision' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s t -l to -d 'Show changes to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s w -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s b -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand log" -s r -l revisions -d 'Which revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s n -l limit -d 'Limit number of revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand log" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand log" -l no-graph -d 'Don\'t show the graph, show a flat list of revisions'
complete -c jj -n "__fish_jj_using_subcommand log" -s p -l patch -d 'Show patch'
complete -c jj -n "__fish_jj_using_subcommand log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand new" -s m -l message -d 'The change description to use' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s A -l insert-after -l after -d 'Insert the new change after the given commit(s)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s B -l insert-before -l before -d 'Insert the new change before the given commit(s)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand new" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand new" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand new" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand new" -s d -d 'Ignored (but lets you pass `-d`/`-r` for consistency with other commands)'
complete -c jj -n "__fish_jj_using_subcommand new" -l no-edit -d 'Do not edit the newly created change'
complete -c jj -n "__fish_jj_using_subcommand new" -l edit -d 'No-op flag to pair with --no-edit'
complete -c jj -n "__fish_jj_using_subcommand new" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand new" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand new" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand new" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand new" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand new" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand next" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand next" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand next" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand next" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand next" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand next" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand next" -s e -l edit -d 'Instead of creating a new working-copy commit on top of the target commit (like `jj new`), edit the target commit directly (like `jj edit`)'
complete -c jj -n "__fish_jj_using_subcommand next" -s n -l no-edit -d 'The inverse of `--edit`'
complete -c jj -n "__fish_jj_using_subcommand next" -l conflict -d 'Jump to the next conflicted descendant'
complete -c jj -n "__fish_jj_using_subcommand next" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand next" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand next" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand next" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand next" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand next" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a abandon -d 'Abandon operation history'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a diff -d 'Compare changes to the repository between two operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a log -d 'Show the operation log'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a restore -d 'Create a new operation that restores the repo to an earlier state'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a show -d 'Show changes to the repository in an operation'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a undo -d 'Create a new operation that undoes an earlier operation'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l operation -l op -d 'Show repository changes in this operation, compared to its parent' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s f -l from -d 'Show repository changes from this operation' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s t -l to -d 'Show repository changes to this operation' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l no-graph -d 'Don\'t show the graph, show a flat list of modified changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s n -l limit -d 'Limit number of operations to show' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s T -l template -d 'Render each operation using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l reversed -d 'Show operations in the opposite order (older operations first)'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l no-graph -d 'Don\'t show the graph, show a flat list of operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s d -l op-diff -d 'Show changes to the repository at each operation'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s p -l patch -d 'Show patch of modifications to changes (implies --op-diff)'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l no-graph -d 'Don\'t show the graph, show a flat list of modified changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from undo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a abandon -d 'Abandon operation history'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a diff -d 'Compare changes to the repository between two operations'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a log -d 'Show the operation log'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a restore -d 'Create a new operation that restores the repo to an earlier state'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a show -d 'Show changes to the repository in an operation'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a undo -d 'Create a new operation that undoes an earlier operation'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l operation -l op -d 'Show repository changes in this operation, compared to its parent' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s f -l from -d 'Show repository changes from this operation' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s t -l to -d 'Show repository changes to this operation' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l no-graph -d 'Don\'t show the graph, show a flat list of modified changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s n -l limit -d 'Limit number of operations to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s T -l template -d 'Render each operation using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l reversed -d 'Show operations in the opposite order (older operations first)'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l no-graph -d 'Don\'t show the graph, show a flat list of operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s d -l op-diff -d 'Show changes to the repository at each operation'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s p -l patch -d 'Show patch of modifications to changes (implies --op-diff)'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l no-graph -d 'Don\'t show the graph, show a flat list of modified changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand prev" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand prev" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand prev" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand prev" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand prev" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand prev" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand prev" -s e -l edit -d 'Edit the parent directly, instead of moving the working-copy commit'
complete -c jj -n "__fish_jj_using_subcommand prev" -s n -l no-edit -d 'The inverse of `--edit`'
complete -c jj -n "__fish_jj_using_subcommand prev" -l conflict -d 'Jump to the previous conflicted ancestor'
complete -c jj -n "__fish_jj_using_subcommand prev" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand prev" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand prev" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand prev" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand prev" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand prev" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand rebase" -s b -l branch -d 'Rebase the whole branch relative to destination\'s ancestors (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s s -l source -d 'Rebase specified revision(s) together with their trees of descendants (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s r -l revisions -d 'Rebase the given revisions, rebasing descendants onto this revision\'s parent(s)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s d -l destination -d 'The revision(s) to rebase onto (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s A -l insert-after -l after -d 'The revision(s) to insert after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s B -l insert-before -l before -d 'The revision(s) to insert before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand rebase" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand rebase" -l skip-empty -d 'Deprecated. Use --skip-emptied instead'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l skip-emptied -d 'If true, when rebasing would produce an empty commit, the commit is abandoned. It will not be abandoned if it was already empty before the rebase. Will never skip merge commits with multiple non-empty parents'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand rebase" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand resolve" -s r -l revision -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -l tool -d 'Specify 3-way merge tool to be used' -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand resolve" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand resolve" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand resolve" -s l -l list -d 'Instead of resolving conflicts, list all the conflicts'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand resolve" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand restore" -s f -l from -d 'Revision to restore from (source)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s t -l into -l to -d 'Revision to restore into (destination)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s c -l changes-in -d 'Undo the changes in a revision as compared to the merge of its parents' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s r -l revision -d 'Prints an error. DO NOT USE' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand restore" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand restore" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand restore" -s i -l interactive -d 'Interactively choose which parts to restore'
complete -c jj -n "__fish_jj_using_subcommand restore" -l restore-descendants -d 'Preserve the content (not the diff) when rebasing descendants'
complete -c jj -n "__fish_jj_using_subcommand restore" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand restore" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand restore" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand restore" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand restore" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand restore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand revert" -s r -l revisions -d 'The revision(s) to apply the reverse of' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s d -l destination -d 'The revision(s) to apply the reverse changes on top of' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s A -l insert-after -l after -d 'The revision(s) to insert the reverse changes after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s B -l insert-before -l before -d 'The revision(s) to insert the reverse changes before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand revert" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand revert" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand revert" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand revert" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand revert" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand revert" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand revert" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand revert" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand root" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand run" -s r -l revisions -d 'The revisions to change' -r
complete -c jj -n "__fish_jj_using_subcommand run" -s j -l jobs -d 'How many processes should run in parallel, uses by default all cores' -r
complete -c jj -n "__fish_jj_using_subcommand run" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand run" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand run" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand run" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand run" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand run" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand run" -s x -d 'A no-op option to match the interface of `git rebase -x`'
complete -c jj -n "__fish_jj_using_subcommand run" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand run" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand run" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand run" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand run" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand show" -s T -l template -d 'Render a revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand show" -s r -d 'Ignored (but lets you pass `-r` for consistency with other commands)'
complete -c jj -n "__fish_jj_using_subcommand show" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand show" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand show" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand show" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand show" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand show" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand show" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand show" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand show" -l no-patch -d 'Do not show the patch'
complete -c jj -n "__fish_jj_using_subcommand show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sign" -s r -l revisions -d 'What revision(s) to sign' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l key -d 'The key used for signing' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sign" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sign" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sign" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sign" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sign" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sign" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sign" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sign" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -s s -l source -d 'Simplify specified revision(s) together with their trees of descendants (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -s r -l revisions -d 'Simplify specified revision(s) (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a edit -d 'Start an editor to update the patterns that are present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a list -d 'List the patterns that are currently present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a reset -d 'Reset the patterns to include all files in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a set -d 'Update the patterns that are present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l add -d 'Patterns to add to the working copy' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l remove -d 'Patterns to remove from the working copy' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l clear -d 'Include no files in the working copy (combine with --add)'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand split" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s r -l revision -d 'The revision to split' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand split" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand split" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand split" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand split" -s i -l interactive -d 'Interactively choose which parts to split'
complete -c jj -n "__fish_jj_using_subcommand split" -s p -l parallel -d 'Split the revision into two parallel revisions instead of a parent and child'
complete -c jj -n "__fish_jj_using_subcommand split" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand split" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand split" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand split" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand split" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand split" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand squash" -s r -l revision -d 'Revision to squash into its parent (default: @)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s f -l from -d 'Revision(s) to squash from (default: @)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s t -l into -l to -d 'Revision to squash into (default: @)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s m -l message -d 'The description to use for squashed revision (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand squash" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand squash" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand squash" -s u -l use-destination-message -d 'Use the description of the destination revision and discard the description(s) of the source revision(s)'
complete -c jj -n "__fish_jj_using_subcommand squash" -s i -l interactive -d 'Interactively choose which parts to squash'
complete -c jj -n "__fish_jj_using_subcommand squash" -s k -l keep-emptied -d 'The source revision will not be abandoned'
complete -c jj -n "__fish_jj_using_subcommand squash" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand squash" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand squash" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand squash" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand squash" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand squash" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand status" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand status" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand status" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand status" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand status" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand status" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand status" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand status" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand status" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand status" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand status" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand st" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand st" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand st" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand st" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand st" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand st" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand st" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand st" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand st" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand st" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand st" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand st" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -f -a list -d 'List tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -f -a l -d 'List tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each tag using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each tag using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a completion -d 'Print a command-line-completion script'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a config-schema -d 'Print the JSON schema for the jj TOML config format'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a exec -d 'Execute an external command via jj'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a gc -d 'Run backend-dependent garbage collection'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a install-man-pages -d 'Install Jujutsu\'s manpages to the provided path'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a markdown-help -d 'Print the CLI help for all subcommands in Markdown'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l bash -d 'Deprecated. Use the SHELL positional argument instead'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l fish -d 'Deprecated. Use the SHELL positional argument instead'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l zsh -d 'Deprecated. Use the SHELL positional argument instead'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l expire -d 'Time threshold' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand undo" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand undo" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand undo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand unsign" -s r -l revisions -d 'What revision(s) to unsign' -r
complete -c jj -n "__fish_jj_using_subcommand unsign" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand unsign" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand unsign" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand unsign" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand unsign" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand unsign" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand unsign" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand unsign" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand version" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand version" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand version" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand version" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand version" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand version" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand version" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand version" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand version" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand version" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand version" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand version" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a add -d 'Add a workspace'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a forget -d 'Stop tracking a workspace\'s working-copy commit in the repo'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a list -d 'List workspaces'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a rename -d 'Renames the current workspace'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a root -d 'Show the current workspace root directory'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a update-stale -d 'Update a workspace that has become stale'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l name -d 'A name for the workspace' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s r -l revision -d 'A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l sparse-patterns -d 'How to handle sparse patterns when creating a new workspace' -r -f -a "copy\t'Copy all sparse patterns from the current workspace'
full\t'Include all files in the new workspace'
empty\t'Clear all files from the workspace (it will be empty)'"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -s h -l help -d 'Print help (see more with \'--help\')'

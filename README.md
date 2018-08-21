```

           ███████╗ █████╗ ██████╗ ██╗
           ██╔════╝██╔══██╗██╔══██╗██║
           █████╗  ███████║██████╔╝██║
           ██╔══╝  ██╔══██║██╔══██╗██║
           ███████╗██║  ██║██║  ██║███████╗
           ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

```
--------------------------------------------------------------------
## Earl the Earl of URLs

### Possible Uses

 - Watch a list of URLs for updates

### Usage Examples:
```
 earl -w path/to/watchlist -d directory/to/store/files
```
 See test/test.sh for a more real world use case
--------------------------------------------------------------------
## Actions
### watch
  watch list of wirls

  - `-w path/to/watchlist` *required*
  - `-d path/to/store/curl/output` *required*
  - `-i [interval in seconds]` defaults to 300 (5 minutes)

### help
  displays help page

--------------------------------------------------------------------
## Options
### -c | --command

  command to execute
### -d | --dir

  directory to store http responses
### -h | --help

  Display this help message
### -i | --interval

  file containing one URL per line
### -m | --markdown

  generate markdown (only used on the help action)
### -w | --watchlist

  file containing one URL per line

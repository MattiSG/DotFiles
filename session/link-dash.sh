# Share Dash heavy datasets across users to share data across sessions
chmod -R g=u /Users/Shared/Dash/
ln -s /Users/Shared/Dash/Cheat\ Sheets ~/Library/Application\ Support/Dash/
ln -s /Users/Shared/Dash/DocSets ~/Library/Application\ Support/Dash/
ln -s /Users/Shared/Dash/GitHub ~/Library/Application\ Support/Dash/
ln -s /Users/Shared/Dash/Stack\ Overflow ~/Library/Application\ Support/Dash/
# do NOT link the Data folder, as the local index is rebuilt each time if the permissions don't match Dash's expectations

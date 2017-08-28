package com.gms.web.command;

public class SearchCommand extends Command{
	public SearchCommand(String directory,String action,String page,String pageNumber,String column,String searchword)
	{
	setDirectory(directory);
	setAction(action);
	setPage(page);
	setPageNumber(pageNumber);
	setColumn(column);
	setSearchWord(searchword);
	process();
	}
}


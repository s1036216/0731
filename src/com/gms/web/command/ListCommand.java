package com.gms.web.command;

public class ListCommand extends Command {
	public ListCommand(String directory,String action,String page,String pageNumber)
	{setDirectory(directory);
	setAction(action);
	setPage(page);
	setPageNumber(pageNumber);
	process();
	}
}

package com.gms.web.command;
import com.gms.web.constaant.Extension;
import com.gms.web.constaant.Path;

public class Command implements Commandable{  //Commandable 서비스임플처럼 기능을 쓰는거
	protected String directory,action,page,view,pageNumber,searchWord,column,startRow,endRow;  //상속하려고  프라이빗 은 은닉

	public String getStartRow() {
		return startRow;
	}

	public void setStartRow(String startRow) {
		this.startRow = startRow;
	}

	public String getEndRow() {
		return endRow;
	}

	public void setEndRow(String endRow) {
		this.endRow = endRow;
	}

	public String getView() {
		return view;
	}

	public String getPageNumber() {
		return pageNumber;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column  =(column==null)?
				"none":column;
				System.out.println("컬럼"+this.column);
	}

	public void setPageNumber(String pageNumber) {
		this.pageNumber = 
				(pageNumber==null)?"1":pageNumber;
		System.out.println("페이지번호"+pageNumber);
			
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = (searchWord==null)?
				"none":searchWord;
				System.out.println("검색어"+this.searchWord);
	}

	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	public String getAction() {
		return action ;
		
	}

	public void setAction(String action) {
		this.action  =(action==null)?
				"move":action;
				System.out.println("엑션"+action);
				
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}



	@Override
	public void process() {
		this.view=
				(directory.equals("home"))?
						"/WEB-INF/view/common/home.jsp":
						Path.VIEW+directory+Path.SEPARARTOR+page+Extension.JSP;
		System.out.println("이동페이지:"+view);
	}
	
	
	@Override
	public String toString() {
		return "Command [DEST=" + directory + "/"+page+".jsp"+ ", ACTION=" + action + "]";
	}

	
}

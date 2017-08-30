package com.gms.web.proxy;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class PageProxy extends Proxy{
    protected int
   pageSize,blockSize,theNumberOfRows,pageNumber;
   
   public int getPageSize() {
	return pageSize;
}
public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}
public int getBlockSize() {
	return blockSize;
}
public void setBlockSize(int blockSize) {
	this.blockSize = blockSize;
}
public int getTheNumberOfRows() {
	return theNumberOfRows;
}
public void setTheNumberOfRows(int theNumberOfRows) {
	this.theNumberOfRows = theNumberOfRows;
}
public int getPageNumber() {
	return pageNumber;
}
public void setPageNumber(int pageNumber) {
	this.pageNumber = pageNumber;
}
public PageProxy(HttpServletRequest request) {
    super(request);
 }
public void execute(int[] arr,List<?>list){
   request.setAttribute("pageNumber", arr[0]);
   request.setAttribute("theNumberOfPages", arr[1]);
   request.setAttribute("startPage", arr[2]);
   request.setAttribute("endPage", arr[3]);
   request.setAttribute("prevBlock", arr[4]);
   request.setAttribute("endBlock", arr[5]);
   request.setAttribute("list", list);
   }
}
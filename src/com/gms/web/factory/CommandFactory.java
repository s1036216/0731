package com.gms.web.factory;
//삼성공장
import com.gms.web.command.*;

import com.gms.web.constaant.Action;
public class CommandFactory {
	public static Command createCommand(String directory,String action,String page,String pageNumber,String column,String searchword){
		Command cmd=null;
		if(action==null){
			action=Action.MOVE;
		}
		switch(action){
		case Action.MOVE: 
			case Action.LOGIN: 
				case Action.LOGOUT: 
					case Action.JOIN:
						case Action.LIST:
							cmd=new ListCommand(directory,action,page,pageNumber);
							break;
							case Action.UPDATE:
								case Action.DELETE:
									case Action.DETAIL:
										cmd=new MoveCommand(directory,action,page);
										break;
										case Action.SEARCH:
											cmd=new SearchCommand(directory,action,page,pageNumber,column,searchword);
											break;	
		
		default:System.out.println("Command Fail");
		break;
		}
				
		return cmd;
	}
}

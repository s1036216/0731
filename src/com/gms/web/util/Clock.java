package com.gms.web.util;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Clock {
	public String getNow(){
				return new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss").format(new Date());
	}
}

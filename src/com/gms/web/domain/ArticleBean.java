package com.gms.web.domain;

import java.io.Serializable;

public class ArticleBean implements Serializable {
		private static final long Serializable = 1L;
			private String id,title,content,regdate;
		private int articleSeq, hitcounht;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		public int getArtcilsSeq() {
			return articleSeq;
		}
		public void setArtcilsSeq(int articleSeq) {
			this.articleSeq = articleSeq;
		}
		public int getHitcounht() {
			return hitcounht;
		}
		public void setHitcounht(int hitcounht) {
			this.hitcounht = hitcounht;
		}
		@Override
		public String toString() {
			return "ArticleBean [id=" + id + ", title=" + title + ", content=" + content + ", regdate=" + regdate
					+ ", artcilsSeq=" + articleSeq + ", hitcounht=" + hitcounht + "]\n";
		}
		
}

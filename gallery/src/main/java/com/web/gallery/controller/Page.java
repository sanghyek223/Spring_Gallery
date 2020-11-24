package com.web.gallery.controller;

public class Page {

	// 현재 페이지 번호
	private int num;

	// 게시물 총 갯수
	private int count;

	// 한 페이지에 출력할 게시물 갯수
	int postNum = 12;

	// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	private int pageNum;

	// 출력할 게시물
	private int displayPost;

	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 5;

	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;

	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;

	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;

	// setter는 2개만 필요로 합니다. 데이터 입력이 필요한건 현재 페이지 num, 게시물 총 갯수 count 이렇게 2개라서 그렇습니다.

	public void setNum(int num) {
		this.num = num;
	}

	public void setCount(int count) {
		this.count = count;
		System.out.println(count);
		dataCalc();
	}

	// getter model에 들어갈 변수
	public int getPostNum() {
		return postNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getDisplayPost() {
		return displayPost;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public boolean getPrev() {
		return prev;
	}

	public boolean getNext() {
		return next;
	}

	private void dataCalc() {

		// 마지막 번호
		endPageNum = (int) (Math.ceil( (double)num /  (double)pageNumCnt) * pageNumCnt);
		System.out.println(num);
		System.out.println(endPageNum);

		// 시작 번호
		startPageNum = endPageNum - (pageNumCnt - 1);
		System.out.println(endPageNum +"- ("+ pageNumCnt+"1)" );
		System.out.println(startPageNum);
		
		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) postNum));
		System.out.println(endPageNum_tmp);
		/*
		 * 마지막 페이지 번호는 다시 한번 더 계산할 필요가 있습니다.
		 * 
		 * 마지막 페이지 번호를 구하는 공식은 위에서 구한대로 [ 마지막 페이지 번호 = ((올림)(현재 페이지 번호 / 한번에 표시할 페이지 번호의
		 * 갯수)) * 한번에 표시할 페이지 번호의 갯수 ]입니다.
		 * 
		 * 만약 게시물 총 갯수가 112개라면, 하단에 표시될 페이지 번호는 1 ~ 10, 11 ~ 12가 되어야합니다. 여기서 한번에 표시할 페이지
		 * 번호의 갯수가 10이고, 현재 페이지가 11일 경우
		 * 
		 * # 1차 계산 [ ((올림)(11 / 10)) * 10 => (올림)1.1 * 10 => 2 * 10 = 20 ] 이 됩니다. 즉, 13
		 * ~ 20까지 없어야할 페이지 번호가 출력됩니다.
		 * 
		 * # 2차 계산 여기에서 게시물 총 갯수와 한번에 표시될 페이지 번호의 갯수를 이용해 재계산합니다. [ (올림)112 / 10 =>
		 * (올림)11.2 => 12 ] 가 됩니다.
		 * 
		 * 1차 계산한 마지막 페이지 번호는 20이며, 2차로 계산한 마지막 페이지 번호는 12입니다. 이 둘을 비교해서 만약 1차 계산이 더
		 * 크다면, 2차로 계산한 값을 넣어줍니다.
		 * 
		 * 다른 예시로, 게시물 총 갯수가 500개이며, 현재 페이지가 5인 경우
		 * 
		 * # 1차 계산 [ ((올림)(5 / 10)) * 10 => (올림)0.5 * 10 => 1 * 10 = 10 ]
		 * 
		 * # 2차 계산 [ (올림)500 / 10 => (올림)50 => 50 ]
		 * 
		 * 1차 계산의 결과가 2차 계산의 결과보다 작으므로 조건문은 false가 되어 실행되지 않으므로, 1차 계산에서 나온 결과인 10이 그대로
		 * 나오게 됩니다.
		 */

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		System.out.println(endPageNum);

		prev = startPageNum == 1 ? false : true;
		next = endPageNum * postNum >= count ? false : true;

		displayPost = (num - 1) * postNum;

	}
	
	public String getSearchTypeKeyword() {
		 
		 if(searchType.equals("")) {
		  return ""; 
		 } else {
		  return "&searchType=" + searchType; 
		 }
	}

		private String searchType;

		public void setSearchType(String searchType) {
		 this.searchType = searchType;  
		}

		public String getSearchType() {
		 return searchType;
		} 


}

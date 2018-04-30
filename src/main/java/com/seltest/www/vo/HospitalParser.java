package com.seltest.www.vo;

	import java.io.BufferedInputStream;
	import java.net.URL;
	import java.util.ArrayList;
	import com.seltest.www.vo.Hospital;

	import org.xmlpull.v1.XmlPullParser;
	import org.xmlpull.v1.XmlPullParserFactory;
	 
	
	public class HospitalParser {
				
	    public final static String HOSPITAL_URL = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList";
	    public final static String KEY = "Iw8eUs320SMUJZsV4SYsFHwkm6cxtJS7W1jS%2FgnYg3MYD%2BC9Ch7oWEe%2BO3ZcfEhylj88eCRoZkZvvf5aO1V8IA%3D%3D";
	    
	    ArrayList<Hospital> list = null;
	    Hospital search = null;
	   	
	    public static void main(String[] args) {
	        new HospitalParser();
	    }
	 	   
	    public ArrayList<Hospital> HospitalParser1(Hospital getSearch) {	    	
	    	search = getSearch;
	    	try {
	            list = apiParserSearch();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    	return list;
	    }
	    
	    public ArrayList<Hospital> apiParserSearch() throws Exception {
	    	URL url = new URL(getURLParam(""));
	        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	        factory.setNamespaceAware(true);
	        XmlPullParser xpp = factory.newPullParser();
	        BufferedInputStream bis = new BufferedInputStream(url.openStream());
	        xpp.setInput(bis, "utf-8");
	        
	        String tag = null;
	        int event_type = xpp.getEventType();
	        ArrayList<Hospital> list = new ArrayList<Hospital>();
	        String yadmNm = null;
	        String addr = null;
	        String hospUrl = null;
	        String telno = null;	        
	        String xPos = null;
	        String yPos = null;
	       	        
	        while (event_type != XmlPullParser.END_DOCUMENT) {
	            if (event_type == XmlPullParser.START_TAG) {
	                tag = xpp.getName();
	            } else if (event_type == XmlPullParser.TEXT) {
	                /**
	                 * 병원의 정보를 가져온다.
	                 */
	            	if(tag.equals("yadmNm")){
	                	yadmNm = xpp.getText();
	                }
	                if(tag.equals("addr")){
	                    addr = xpp.getText();
	                }
	                if(tag.equals("hospUrl")){
	                	hospUrl = xpp.getText();
	                }
	                if(tag.equals("telno")){
	                	telno = xpp.getText();
	                }
	                if(tag.equals("XPos")){
	                	xPos = xpp.getText();
	                }
	                if(tag.equals("YPos")){
	                	yPos = xpp.getText();
	                }	
	            } else if (event_type == XmlPullParser.END_TAG) {
	                tag = xpp.getName();
	                if (tag.equals("item")) {
	                	Hospital hos = new Hospital();
	                    hos.setYadmNm(yadmNm);
	                    hos.setAddr(addr);
	                    hos.setHospUrl(hospUrl);
	                    hos.setTelno(telno);
	                    hos.setxPos(xPos);
	                    hos.setyPos(yPos);
	                	list.add(hos);
	                }
	            }
	 
	            event_type = xpp.next();
	        }
	        //print(list);
	        return list;
	    }  
	    
	    //출력
	   /*private void print(ArrayList<Hospital> list){
		   for(int i = 0; i<list.size(); i++){
	    		System.out.println(list);
	    	}
	    }*/
	    
	    //검색
	    private String getURLParam(String searchStr){
	    	String url = HOSPITAL_URL+"?ServiceKey="+KEY+"&numOfRows="+search.getNumOfRows();
	    	if(search.getDgsbjtCd() != null){
	    		url = url + "&dgsbjtCd=" + search.getDgsbjtCd();
	    	}
	    	if(search.getxPos() != null){
	    		url = url + "&xPos=" + search.getxPos();
	    	}
	    	if(search.getyPos() != null){
	    		url = url + "&yPos=" + search.getyPos();
	    	}
	    	if(search.getRadius() != null){
	    		url = url + "&radius="+search.getRadius();
	    	}
	    	if(search.getSgguCd() != null){
	    		url = url + "&sgguCd="+search.getSgguCd();
	    	}
	    	if(search.getYadmNm() != null){
	    		url = url + "&yadmNm="+search.getYadmNm();
	    	}
	    	
	        if(url != null){
		        url = url+"";	        
		        }
	        return url;
	    }
	 
	   
	 
	}
	
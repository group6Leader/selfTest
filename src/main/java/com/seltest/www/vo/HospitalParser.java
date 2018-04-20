package com.seltest.www.vo;

	import java.io.BufferedInputStream;
	import java.net.URL;
	import java.util.ArrayList;
	 
	import org.xmlpull.v1.XmlPullParser;
	import org.xmlpull.v1.XmlPullParserFactory;
	 
	public class HospitalParser {
	 
	    public final static String PHARM_URL = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList";
	    public final static String KEY = "Iw8eUs320SMUJZsV4SYsFHwkm6cxtJS7W1jS%2FgnYg3MYD%2BC9Ch7oWEe%2BO3ZcfEhylj88eCRoZkZvvf5aO1V8IA%3D%3D";
	 
	    public HospitalParser() {
	        try {
	            apiParserSearch();
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }
	 
	    
	    /**
	     * 
	     * @throws Exception
	     */
	    public void apiParserSearch() throws Exception {
	        URL url = new URL(getURLParam(null));
	 
	        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	        factory.setNamespaceAware(true);
	        XmlPullParser xpp = factory.newPullParser();
	        BufferedInputStream bis = new BufferedInputStream(url.openStream());
	        xpp.setInput(bis, "utf-8");
	        
	        String tag = null;
	        int event_type = xpp.getEventType();
	        
	        ArrayList<String> list = new ArrayList<String>();
	        
	        String addr = null;
	        while (event_type != XmlPullParser.END_DOCUMENT) {
	            if (event_type == XmlPullParser.START_TAG) {
	                tag = xpp.getName();
	            } else if (event_type == XmlPullParser.TEXT) {
	                /**
	                 * 병원의 주소만 가져와본다.
	                 */
	                if(tag.equals("addr")){
	                    addr = xpp.getText();
	                }
	            } else if (event_type == XmlPullParser.END_TAG) {
	                tag = xpp.getName();
	                if (tag.equals("item")) {
	                    list.add(addr);
	                }
	            }
	 
	            event_type = xpp.next();
	        }
	        printList(list);
	    }
	    
	    /**
	     * 결과 값을 출력해본다.
	     * @param list
	     */
	    private void printList(ArrayList<String> list){
	        for(String entity : list){
	            System.out.println(entity);
	        }
	        
	        
	    }
	    
	    
	    
	    private String getURLParam(String search){
	        String url = PHARM_URL+"?ServiceKey="+KEY;
	        if(search != null){
	        url = url+"&yadmNm"+search;
	        }
	        return url;
	    }
	 
	    public static void main(String[] args) {
	        // TODO Auto-generated method stub
	        new HospitalParser();
	    }
	 
	}
	


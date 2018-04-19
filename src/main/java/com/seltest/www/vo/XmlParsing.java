package com.seltest.www.vo;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParsing {

	//tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement){
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if(nValue == null){
			return null;
		}
		return nValue.getNodeValue();		
	}
	
	public static void main (String[] args){
		int page = 1;		//페이지 초기값
		try{
			while(true){
				// parsing할 url 지정(API 키 포함해서)
				String url = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?ServiceKey=Iw8eUs320SMUJZsV4SYsFHwkm6cxtJS7W1jS%2FgnYg3MYD%2BC9Ch7oWEe%2BO3ZcfEhylj88eCRoZkZvvf5aO1V8IA%3D%3D"+page;
				
				// 페이지에 접근해 줄 Document 객체 생성
				//여기서 생성한 document 객체를 통해 파싱할 url의 요소를 읽어 들인다.
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// root tag
				doc.getDocumentElement().normalize();
				//doc.getDocumentElement().getNodeName()를 출력하면 XML의 최상위 tag를 가져온다.
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
				
				// 파싱할 데이터는 <item> 이라는 tag 안에 있다. 여기로 접근
				NodeList nList = doc.getElementsByTagName("item");
				//nList에 <item>태그가 하나씩 담기게 되고 getLength()를 통해 리스트 수를 확인 가능
				System.out.println("파싱할 리스트 수 : " + nList.getLength());
				
				// list에 담긴 데이터를 반복문을 이용하여 출력
				// getTextContent() : 전체 정보
				// getTagValue("tag", element) : 입력한 tag 정보(따로 메소드를 정의해 주어야 한다.)
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						Element eElement = (Element) nNode;
						System.out.println("#################");
						//System.out.printLn(eElement.getTextContent());
						System.out.println("병원명 : " + getTagValue("yadmNm", eElement));
						System.out.println("종별코드명 : " + getTagValue("clCdNm", eElement));
						System.out.println("주소 : " + getTagValue("addr", eElement));
						System.out.println("x좌표 : " + getTagValue("xPos", eElement));
						System.out.println("y좌표 : " + getTagValue("yPos", eElement));
					}					
				}
				
				page += 1;
				System.out.println("page number : " + page);
				if(page > 12){
					break;
				}
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}

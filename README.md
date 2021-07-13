# 😃 Study

### 1. Stream
과정 : 생성하기 - 가공하기 - 결과 만들기

##### (1) 배열 스트림 
- Arrays.stream 메소드를 사용
```java
String[] arr = new String[]{"a", "b", "c"};
Stream<String> stream = Arrays.stream(arr);
Stream<String> streamOfArrayPart = 
  Arrays.stream(arr, 1, 3); // 1~2 요소 [b, c]
```

##### (2) 컬렉션 스트림
- 컬렉션 타입(Collection, List, Set)의 경우 인터페이스에 추가된 디폴트 메소드 stream 을 이용해서 스트림을 만들 수 있다. 
```java
public interface Collection<E> extends Iterable<E> {
  default Stream<E> stream() {
    return StreamSupport.stream(spliterator(), false);
  } 
}
```
- Ex) 
```java 
List<String> list = Arrays.asList("a", "b", "c");
Stream<String> stream = list.stream();
Stream<String> parallelStream = list.parallelStream(); // 병렬 처리 스트림

```


##### (3) Stream.builder()
- 빌더를 이용해 직접적으로 스트림 안에 원하는 값 넣을 수 있다. 
```java
Stream<String> builderStream = 
  Stream.<String>builder()
    .add("Eric").add("Elena").add("Java")
    .build(); // [Eric, Elena, Java]
```

##### (4) Stream.iterate()
- iterate 메소드 이용 예제
```java
Stream<Integer> iteratedStream = 
  Stream.iterate(30, n -> n + 2).limit(5); // [30, 32, 34, 36, 38]

```

##### (5) 문자열 스트링
```java
Stream<String> stringStream = 
  Pattern.compile(", ").splitAsStream("Eric, Elena, Java");
  // [Eric, Elena, Java]
```

##### (6) 파일 스트링 
- Files 클래스의 lines 메소드는 해당 파일의 각 라인을 스트링 타입의 스트림으로 만들어준다. 
```java
Stream<String> lineStream = 
  Files.lines(Paths.get("file.txt"), 
              Charset.forName("UTF-8"));

```


##### (7) 스트림 연결하기
- Stream.concat 메소드를 이용해 두 개의 스트림을 연결해서 새로운 스트림을 만들어낼 수 있다.

```java
Stream<String> stream1 = Stream.of("Java", "Scala", "Groovy");
Stream<String> stream2 = Stream.of("Python", "Go", "Swift");
Stream<String> concat = Stream.concat(stream1, stream2);
```
<br>
<br>
<hr>

### ✍ 2. Map
- 거의 HashMap을 사용


##### (1) HashMap 개념 
- Map은 키와 값으로 구성된 Entry객체를 저장하는 구조를 가지고 있는 자료구조다. 
- 키와 값은 모두 객체 
- 값은 중복 저장될 수 있지만 키는 중복 저장될 수 없음 
- 만약 기존에 저장된 키와 동일한 키로 값을 저장하면 기존의 값은 없어지고 새로운 값으로 대치됨
- HashMap은 내부에 '키'와 '값'을 저장하는 자료 구조를 가지고 있다. HashMap은 해시 함수를 통해 '키'와 '값'이 저장되는 위치를 결정하므로, 사용자는 그 위치를 알 수 없고, 삽입되는 순서와 들어 있는 위치 또한 관계가 없음 

##### (2) HashMap 선언 
```java
HashMap<String,String> map1 = new HashMap<String,String>();//HashMap생성
HashMap<String,String> map2 = new HashMap<>();//new에서 타입 파라미터 생략가능
HashMap<String,String> map3 = new HashMap<>(map1);//map1의 모든 값을 가진 HashMap생성
HashMap<String,String> map4 = new HashMap<>(10);//초기 용량(capacity)지정
HashMap<String,String> map5 = new HashMap<>(10, 0.7f);//초기 capacity,load factor지정
HashMap<String,String> map6 = new HashMap<String,String>(){{//초기값 지정
    put("a","b");
}};
```

##### (2) HashMap 값 추가
```java
HashMap<Integer,String> map = new HashMap<>();//new에서 타입 파라미터 생략가능
map.put(1,"사과"); //값 추가
map.put(2,"바나나");
map.put(3,"포도");
```


##### (3) HashMap 값 삭제
```java
HashMap<Integer,String> map = new HashMap<Integer,String>(){{//초기값 지정
    put(1,"사과");
    put(2,"바나나");
    put(3,"포도");
}};
map.remove(1); //key값 1 제거
map.clear(); //모든 값 제거
```

##### (4) HashMap 값 출력 
```java
HashMap<Integer,String> map = new HashMap<Integer,String>(){{//초기값 지정
    put(1,"사과");
    put(2,"바나나");
    put(3,"포도");
}};
System.out.println(map); //전체 출력 : {1=사과, 2=바나나, 3=포도}
System.out.println(map.get(1));//key값 1의 value얻기 : 사과
		
```
- entrySet() 활용
```java
//entrySet() 활용
for (Entry<Integer, String> entry : map.entrySet()) {
    System.out.println("[Key]:" + entry.getKey() + " [Value]:" + entry.getValue());
}
//[Key]:1 [Value]:사과
//[Key]:2 [Value]:바나나
//[Key]:3 [Value]:포도
```

- keySet() 활용
```java
//KeySet() 활용
for(Integer i : map.keySet()){ //저장된 key값 확인
    System.out.println("[Key]:" + i + " [Value]:" + map.get(i));
}
//[Key]:1 [Value]:사과
//[Key]:2 [Value]:바나나
//[Key]:3 [Value]:포도
```




##### (5) Iterator 사용
```java
HashMap<Integer,String> map = new HashMap<Integer,String>(){{//초기값 지정
    put(1,"사과");
    put(2,"바나나");
    put(3,"포도");
}};
```
- entrySet.iterator
```java
//entrySet().iterator()
Iterator<Entry<Integer, String>> entries = map.entrySet().iterator();
while(entries.hasNext()){
    Map.Entry<Integer, String> entry = entries.next();
    System.out.println("[Key]:" + entry.getKey() + " [Value]:" +  entry.getValue());
}
//[Key]:1 [Value]:사과
//[Key]:2 [Value]:바나나
//[Key]:3 [Value]:포도
```
- keySet.iterator
```java
//keySet().iterator()
Iterator<Integer> keys = map.keySet().iterator();
while(keys.hasNext()){
    int key = keys.next();
    System.out.println("[Key]:" + key + " [Value]:" +  map.get(key));
}
//[Key]:1 [Value]:사과
//[Key]:2 [Value]:바나나
//[Key]:3 [Value]:포도
```

<br>
<hr>
<br>

### ✍ 3. Generic
- 개요 : 우리가 흔히 쓰는 ArrayList는 어떻게 쓸까?
- 보통 아래와 같이 쓴다. 
```java
ArrayList<Integer> list1 = new ArrayList<Integer>();
ArrayList<String> list2 = new ArrayList<Integer>();
```
- 이렇게 타입을 미리 지정해주면 유연성이 떨어진다. 

##### (1) 제네릭이란?
- 제네릭은 위의 ArrayList와는 다르게 클래스 내부에서 지정하는 게 아닌 외부에서 사용자에 의해 지정되는 것을 의미한다. 즉, 타입을 미리 지정해주는 것이 아닌 필요에 의해 지정할 수 있도록 하는 일반(Generic) 타입이라는 것이다. 
- 장점 
  -  클래스 외부에서 타입을 지정해주기 때문에 따로 타입을 체크하고 변환해줄 필요가 없다. 즉, 관리하기가 편하다.
  -  비슷한 기능을 지원하는 경우 코드의 재사용성이 높아진다.

##### (2) 클래스 및 인터페이스 선언 
- 기본
```java
public class ClassName <T> { ... }
public Interface InterfaceName <T> { ... }
```
- 타입 두 개 선언
```java
public class ClassName <T, K> { ... }
public Interface InterfaceName <T, K> { ... }
```
- 선언된 제네릭에 타입주기(int, double 등 primitive Type은 올 수 없고 Wrapper Type으로 줄 수 있다.)
```java
public class ClassName <T, K> { ... }
 
public class Main {
	public static void main(String[] args) {
		ClassName<String, Integer> a = new ClassName<String, Integer>();
	}
}
```

##### (3) 제네릭 클래스 사용하기 
- 기본
```java
// 제네릭 클래스
class ClassName<E> {
	
	private E element;	// 제네릭 타입 변수
	
	void set(E element) {	// 제네릭 파라미터 메소드
		this.element = element;
	}
	
	E get() {	// 제네릭 타입 반환 메소드
		return element;
	}
	
}
 
class Main {
	public static void main(String[] args) {
		
		ClassName<String> a = new ClassName<String>();
		ClassName<Integer> b = new ClassName<Integer>();
		
		a.set("10");
		b.set(10);
	
		System.out.println("a data : " + a.get());
		// 반환된 변수의 타입 출력 
		System.out.println("a E Type : " + a.get().getClass().getName());
		
		System.out.println();
		System.out.println("b data : " + b.get());
		// 반환된 변수의 타입 출력 
		System.out.println("b E Type : " + b.get().getClass().getName());
		
	}
  // a data : 10
  // a E Type : java.lang.String

  // b.data : 10
  // b E Type : java.lang.Integer

}
```
- 두 개 사용
```java
// 제네릭 클래스 
class ClassName<K, V> {	
	private K first;	// K 타입(제네릭)
	private V second;	// V 타입(제네릭) 
	
	void set(K first, V second) {
		this.first = first;
		this.second = second;
	}
	
	K getFirst() {
		return first;
	}
	
	V getSecond() {
		return second;
	}
}
 
// 메인 클래스 
class Main {
	public static void main(String[] args) {
		
		ClassName<String, Integer> a = new ClassName<String, Integer>();
		
		a.set("10", 10);
 
 
		System.out.println("  fisrt data : " + a.getFirst());
		// 반환된 변수의 타입 출력 
		System.out.println("  K Type : " + a.getFirst().getClass().getName());
		
		System.out.println("  second data : " + a.getSecond());
		// 반환된 변수의 타입 출력 
		System.out.println("  V Type : " + a.getSecond().getClass().getName());
	}

  // first data : 10
  // K Type : java.lang.String

  // second data : 10
  // V Type : java.lang.Integer
}

```
<br>
<br>
<hr>

### ✍ 3. KeyCode로 특정 키 막기


- 키코드 표 
<img src="/img/keycode.PNG" width="100%"></img>
```java
	// . + -  키코드로 막기
		window.addEventListener("keydown", function (event) {
		if (event.defaultPrevented) {
			return;
		}

		var handled = false;

  		// numlock - 입력 제한
		if (event.keyCode ==109)
    		handled = true;

		// numlock + 입력 제한
		else if (event.keyCode == 107)
			handled = true;

		// numlock . 입력 제한
		else if(event.keyCode == 110)
			handled = true;

		// + 입력 제한
		else if(event.keyCode == 189)
			handled = true;

		// - 입력 제한
		else if(event.keyCode == 187)
			handled = true;

		// . 입력제한
		else if(event.keyCode == 190)
			handled = true;

		if (handled) {
			console.log(event.keyCode);
			event.preventDefault();
		}
	}, true);
```
<br>
<br>
<hr>

### ✍ 4. 정규식 공부하기


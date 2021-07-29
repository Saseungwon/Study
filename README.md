# 😃Study

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

## ✍ 4. 정규식 공부하기
- 이메일 정규식(java에서 js랑 다르게 써야됨)
```java
 /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
```
- 전화번호 정규식 하이픈 자동으로 넣어주기
```java
//input 안에 class phoneNumber 넣기 
$(document)
.on(
	"keyup",
	".phoneNumber",
	function() {
		$(this).val($(this)
			   .val()
			   .replace(/[^0-9]/g, "")
			   .replace(
					/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,
					"$1-$2-$3").replace(
					"--", "-"));
	}
);


```

<br>
<br>
<hr>

## ✍ 5. Thread란?

- 프로세스 : 운영체제로부터 자원을 할당 받는 작업의 단위
- 스레드 : 프로세스가 할당받은 자원을 이용하는 실행의 단위, 프로세스 내에서 실제로 작업을 수행하는 주체
  - 각각의 스레드는 독립적인 작업을 수행해야 하기 때문에 각자의 스택과 레지스터 값을 가짐
  - 커널의 도움없이 상호간 통신 가능 
  - 독립적인 스택 
    - 독립적인 함수 호출 가능
    - 독립적인 실행 흐름 가능 

<br>

### 1. 스레드의 생성과 실행 
(1) Thread 클래스 상속받는 방법 
(2) Runnable 인터페이스 구현하는 방법 
- Thread 클래스를 상속받으면 다른 클래스를 상속받을 수 없으므로, 일반적으로 Runnable 인터페이스를 구현하는 방법으로 스레드를 생성합니다.
- Runnable 인터페이스는 몸체가 없는 메소드인 run() 메소드 단 하나만을 가지는 간단한 인터페이스입니다.



```java
class ThreadWithClass extends Thread {
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(getName()); // 현재 실행 중인 스레드의 이름을 반환함.
            try {
                Thread.sleep(10);          // 0.01초간 스레드를 멈춤.
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
 

class ThreadWithRunnable implements Runnable {
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(Thread.currentThread().getName()); // 현재 실행 중인 스레드의 이름을 반환함.
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

 

public class Thread01 {
    public static void main(String[] args){
        ThreadWithClass thread1 = new ThreadWithClass();       // Thread 클래스를 상속받는 방법
        Thread thread2 = new Thread(new ThreadWithRunnable()); // Runnable 인터페이스를 구현하는 방법


        thread1.start(); // 스레드의 실행
        thread2.start(); // 스레드의 실행
    }
}

<!-- 
Thread-0
Thread-1
Thread-0
Thread-1
Thread-0
Thread-1
Thread-0
Thread-1
Thread-0
Thread-1 
-->
```
<br>
<br>

### 2. 스레드 우선순위 
```java
thread.setPriority(우선순위);
```
- 우선순위가 높은 스레드가 실행상태를 더 많이 가져감 
- 객체에 우선순위를 부여하여 개발자가 제어가능 
- 1 ~ 10까지 우선순위, 높으면 먼저 실행 
```java
// 우선순위 상수 
Thread.MAX_PRIORITY(10), Thread.NORM_PRIORITY(5), Thread.MIN_PRIORITY(1)
```
- 우선순위가 높은 스레드가 실행기회를 더 많이 가지기 때문에 우선순위가 더 낮은 스레드보다 같은 작업이라도 빨리 끝낼 수 있다.
- 하지만 쿼드 코어일 경우 스레드가 4개 보다 적을 경우는 우선순위가 크게 영향을 미치지 못한다. 5개이상일때 우선순위 방식이 효과를 보게 된다.

```java
class ThreadWithRunnable implements Runnable {
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(Thread.currentThread().getName()); // 현재 실행 중인 스레드의 이름을 반환함.
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}


public class Thread02 {
    public static void main(String[] args){
        Thread thread1 = new Thread(new ThreadWithRunnable());
        Thread thread2 = new Thread(new ThreadWithRunnable());
 
①      thread2.setPriority(10); // Thread-1의 우선순위를 10으로 변경함.
②      thread1.start(); // Thread-0 실행
③      thread2.start(); // Thread-1 실행

        System.out.println(thread1.getPriority());
        System.out.println(thread2.getPriority());
    }
}

// 5
// 10
// Thread-1
// Thread-0
// Thread-1
// Thread-0
// Thread-1
// Thread-0
// Thread-1
// Thread-0
// Thread-1
// Thread-0

```
<br>
<br>

### 2. 멀티 스레드 
1. 장점
- 하나의 프로세스 내에서 둘 이상의 스레드가 동시에 작업을 수행하는 것을 의미한다. 
- 멀티스레드는 각 스레드가 자신이 속한 프로세스의 메모리를 공유해서 시스템 낭비가 적다. 
- 하나의 스레드가 작업할 때 다른 스레드가 별도의 작업을 할 수 있어 사용자와의 응답성도 좋아짐 

2. 단점(문맥교환)
- cpu 코어 수보다 많은 스레드가 실행되면 각 코어가 정해진 시간 동안 여러 작업을 번갈아 수행하는데 이때 스레드가 서로 교체될 때 스레드 간의 문맥교환이라는 것이 발생한다. 
- 문맥교환 : 현재까지의 작업 상태나 다음 작업에 필요한 각종 데이터를 저장하고 읽어오는 작업을 가리킴 
- 문맥 교환에 걸리는 시간이 커질수록 멀티스레딩의 효율은 저하된다.
- 오히려 많은 양의 단순한 계산은 싱글 스레드로 동작하는 것이 더 효율적일 수 있다. 
- 따라서 많은 수의 스레드를 실행하는 것이 언제나 좋은 성능을 보이는 것은 아니다. 
<br>
<br>

### 3. 스레드 그룹 

- 스레드 그룹(thread group)이란 서로 관련이 있는 스레드를 하나의 그룹으로 묶어 다루기 위한 장치다.
- 자바에서는 스레드 그룹을 다루기 위해 ThreadGroup이라는 클래스를 제공한다.
- 이러한 스레드 그룹은 다른 스레드 그룹을 포함할 수도 있으며, 이렇게 포함된 스레드 그룹은 트리 형태로 연결된다.
이때 스레드는 자신이 포함된 스레드 그룹이나 그 하위 그룹에는 접근할 수 있지만, 다른 그룹에는 접근할 수 없다.
이렇게 스레드 그룹은 스레드가 접근할 수 있는 범위를 제한하는 보안상으로도 중요한 역할을 하고 있다.

```java
class ThreadWithRunnable implements Runnable {
    public void run() {
        try {
            Thread.sleep(10); // 0.01초간 스레드를 멈춤.
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}


public class Thread03 {
    public static void main(String[] args){
        Thread thread0 = new Thread(new ThreadWithRunnable());
        thread0.start(); // Thread-0 실행
        System.out.println(thread0.getThreadGroup());

 
        ThreadGroup group = new ThreadGroup("myThread"); // myThread라는 스레드 그룹 생성함.
        group.setMaxPriority(7); // 해당 스레드 그룹의 최대 우선순위를 7로 설정함.

 
        // 스레드를 생성할 때 포함될 스레드 그룹을 전달할 수 있음.
        Thread thread1 = new Thread(group, new ThreadWithRunnable());
        thread1.start(); // Thread-1 실행
        System.out.println(thread1.getThreadGroup());
    }

// 	java.lang.ThreadGroup[name=main,maxpri=10]
// 	java.lang.ThreadGroup[name=myThread,maxpri=7]
 }
```
- 위의 예제처럼 main() 메소드에서 생성된 스레드의 기본 스레드 그룹의 이름은 "main"이 되며, 최대 우선순위는 10으로 자동 설정됩니다.

<img src="/img/Thread.PNG" width="90%"></img>

**스레드 그룹을 사용하는 이점**

- 그룹내 포함된 모든 스레드들을 일괄 interrupt() 시켜서 안전하게 종료할 수 있다. 여러번 할걸 한번에 가능하다는 것.
- 하지만 스레드 그룹의 interrupt() 메소드는 소속된 스레드의 interrupt() 메소드를 실행만 할뿐 개별 스레드의 InterruptedException 예외처리는 하지 않는다.

- 개별 스레드에서 InterruptedException 처리를 해주어야 한다.

```java
public class WorkThread extends Thread{
	public WorkThread(ThreadGroup threadGroup, String threadName) {
		super(threadGroup, threadName);
	}
	
	@Override
	public void run() {
		while(true) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				System.out.println(getName()+" interrupted");
				break;
			}
		}
		System.out.println(getName()+ " 종료됨");
	}
}

public class Main{
	public static void main(String[] args) {
		ThreadGroup myGroup = new ThreadGroup("myGroup");
		WorkThread workThreadA = new WorkThread(myGroup, "workThreadA");
		WorkThread workThreadB = new WorkThread(myGroup, "workThreadB");
		
		workThreadA.start();
		workThreadB.start();
		
		System.out.println("[main 스레드 그룹의 list() 메소드 출력 내용]");
		ThreadGroup mainGroup = Thread.currentThread().getThreadGroup(); //현재스레드의 그룹
		mainGroup.list();
		
		System.out.println();
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {}
		
		System.out.println("[myGroup 스레드 그룹의 interrupted() 메소드 호출]");
		myGroup.interrupt();
	}
}
```


<br>
<br>

### 4. 스레드 동기화 메서드, 동기화 블럭  
문제상황
```
Tread-1이 공유객체의 멤버변수에 할당된 값을 변경. 
-> 그사이 Thread-2가 공유 객체의 멤버변수에 할당된 값을(null이 아닌지 모르고) 엎어침. 
-> Thread-1 공유객체 사용하려는데 값이바뀜. -> 오류!!

이를 방지하기 위해 단 하나의 스레드만을 실행할 수 있는 임계영역을 지정해야 한다. 
즉, 객체에 잠금을 걸어두어 하나의 스레드만이 접근가능하고 나머지 스레드는 대기하도록 만든다.
```



(1) 동기화 메서드 
```java
public synchronized void method(){
	//임계영역; 단하나의 스레드만 실행가능.
}
```
- java synchronized
멀티스레드를 잘 사용하면 프로그램적으로 좋은 성능을 낼 수 있지만,
멀티스레드 환경에서 반드시 고려해야할 점인 스레드간 동기화라는 문제는 꼭 해결해야한다.
예를 들어 스레드간 서로 공유하고 수정할 수 있는 data가 있는데 스레드간 동기화가 되지 않은 상태에서 멀티스레드 프로그램을 돌리면, data의 안정성과 신뢰성을 보장할 수 없다.
따라서 data의 thread-safe 를 하기 위해 자바에서는 synchronized 키워드를 제공해 스레드간 동기화를 시켜 data의 thread-safe를 가능케한다.
자바에서 지원하는 Synchronized 키워드는 여러개의 스레드가 한개의 자원을 사용하고자 할 때, 현재 데이터를 사용하고 있는 해당 스레드를 제외하고 나머지 스레드들은 데이터에 접근 할 수 없도록 막는 개념이다.



- ex)
```java
package sync;

public class Calculator {
	private int memory;
	
	public int getMemory() {
		return memory;
	}
	//동기화 메소드로 선언하는 방법
	public synchronized void setMemory(int memory) { 
		this.memory = memory;
		try {
			Thread.sleep(2000);
		}catch(InterruptedException e) {}
		System.out.println(Thread.currentThread().getName()+" : "+this.memory);
	}
}
```


(2) 동기화 블럭 
```java
public void method(){
	synchronized (공유객체){
    	//임계영역(단 하나의 스레드만 실행 가능)
    }
    //여러 스레드가 실행 가능한 영역.
}
```
- ex)
```java
package sync;

public class Calculator {
	private int memory;
	
	public int getMemory() {
		return memory;
	}
	
	// 이렇게 동기화 블럭을 사용해서 처리할 수 있다.
	public void setMemory(int memory) {
		synchronized (this) {
			this.memory = memory;
			try {
				Thread.sleep(2000);
			}catch(InterruptedException e) {}
			System.out.println(Thread.currentThread().getName()+" : "+this.memory);
		}
	}
}
```

<br>
<br>

### 5. 스레드 상태제어  
- 실행중인 스레드의 상태를 변경
- interrupt(), sleep(), join(), wait(), yield() notify(), notifyAll() 등의 메소드가 존재.
- 이중 notify(), notifyAll(), wait() 메소드는 Object 클래스의 메소드이고 나머지는 Thread 클래스의 메소드.

(1) sleep() : 일시정지
-  일시정지 상태에서 interrupt() 메소드를 호출할 경우 InterruptedException이 발생됨.
```java
try{
	Thread.sleep(1000); //1초간 일시정지(밀리초 : 1000 -> 1초)
}catch(InterruptedException){
	//interrupt() 메소드가 호출되면 실행.
}
```

(2) yield() : 타 스레드에 실행 양보 
- yield() 메소드를 호출하면 호출한 스레드는 실행대기상태로 돌아가고 동일한 우선순위 혹은 높은 우선순위를 갖는 다른 스레드가 실행 기회를 갖게됨.
```java
public class ThreadA extends Thread{
	public boolean stop = false; //종료 플래그
	public boolean work = true; // 작업진행여부
	
	public void run() {
		while(!stop) {
			if(work) {
				System.out.println("ThreadA 작업 내용");
			}else {
				Thread.yield();
			}
		}
		System.out.println("ThreadA 종료");
	}
}
```
(3) join() : 다른 스레드의 종료를 기다림
- 다른 스레드가 종료되어야 실행해야하는 스레드가 존재

- 계산작업이 그 예인데, 계산하여 결과를 return 하는 스레드가 존재하면 그것을 출력하는 스레드가 필요한데

- 그 때 출력스레드가 먼저 수행되면 오류임.
```java
public class SumThread extends Thread{
	private long sum;

	public long getSum() {
		return sum;
	}

	public void setSum(long sum) {
		this.sum = sum;
	}

	public void run() {
		for(int i =1; i<=100; i++) {
			sum+=i;
		}
	}
	
	@Override
	public String toString() {
		return "SumThread [sum=" + sum + "]";
	}
}

public class JoinExample {
	public static void main(String[] args) {
		SumThread sumThread = new SumThread();
		sumThread.start();
		
		try {
			sumThread.join();//현재 스레드 기준 (이부분을 주석처리해서 결과를 비교해보세요)
		} catch (Exception e) {
		}
		System.out.println("1~100 합 : "+sumThread.getSum());
	}
}
```
(4) wait(), notify(). notifyAll() : 스레드 간 협력 
- 두개의 스레드를 번갈아가면서 실행

- 핵심은 공유객체의 활용

- 두 스레드가 작업할 내용을 동기화 메소드로 구분.

- 스레드1 작업 완료 -> notify() 메소드 호출 -> (일시정지)스레드 2 실행대기상태로 변경 -> 스레드 1은 wait() (일시정지 상태)

- 이들 메소드는 동기화 메소드 혹은 동기화 블록에서만 사용가능.
```java
//공유객체
public class WorkObject {
	public synchronized void methodA() {
		System.out.println("ThreadA의 methodA() 작업 실행");
		notify(); //일시정지 상태에 있는 ThreadB를 실행대기 상태로 만듬.
		try {
			wait();//ThreadA를 일시정지 상태로 만듬.
		} catch (Exception e) {
		}
	}
	
	public synchronized void methodB() {
		System.out.println("ThreadB의 methodB() 작업 실행");
		notify(); //일시정지 상태에 있는 ThreadA를 실행대기 상태로 만듬.
		try {
			wait();//ThreadB를 일시정지 상태로 만듬.
		} catch (Exception e) {
		}
	}
}

//Thread A
public class ThreadA extends Thread{
	private WorkObject workObject;
	
	public ThreadA(WorkObject workObject) {
		this.workObject = workObject;
	}
	
	@Override
	public void run() {
		for(int i =0; i<10; i++) {
			workObject.methodA();
		}
	}
}

//ThreadB
public class ThreadB extends Thread{
	private WorkObject workObject;
	
	public ThreadB(WorkObject workObject) {
		this.workObject = workObject;
	}
	
	@Override
	public void run() {
		for(int i =0; i<10; i++) {
			workObject.methodB();
		}
	}
}

//main 스레드
public class WaitNotifyExample {
	public static void main(String[] args) {
		WorkObject shareObject = new WorkObject(); //공유객체 생성
		
		ThreadA threadA = new ThreadA(shareObject);
		ThreadB threadB = new ThreadB(shareObject);//ThreadA와 ThreadB 생성
		
		threadA.start();
		threadB.start();
				
	}
}
```
- 메인 스레드에서 공유객체를 생성

- 각각의 스레드의 멤버변수로 초기화. 공유 객체의 methodA와 methodB를 사용

- methodA와 methodB는 번갈아가면서 실행되어야함.


(4) interrupt() : 스레드의 안전종료 
- run() 메소드가 모두 실행되면 스레드는 종료됨.

- 기존의 stop() 이란 메소드가 제공되었으나 deprecated 되었다. -> 문제

- 왜? -> 스레드가 사용하던 자원이 문제가 될 가능성( 자원이란 파일, 네트워크 연결 등)

- interrupt() 메소드를 이용하여 자원도 해제하며 안전하게 종료할 수 있음.
```java
public class PrintThread2 extends Thread{
	public void run() {
		try {
			while(true) {
				System.out.println("실행 중");
				Thread.sleep(1);
				//if(Thread.interrupted()) {
				//if(Thread.currentThread().isInterrupted()) {
					//break;
				//}
			}
		} catch (InterruptedException e) {
			System.out.println("interrupt() 실행");
		}
		System.out.println("자원 정리");
		System.out.println("실행 종료");
	}
}

//메인 스레드
public class InterruptExample {
	public static void main(String[] args) {
		Thread thread = new PrintThread2();
		thread.start();
		
		try {
			Thread.sleep(1000);
		} catch (Exception e) {
			
		}
		thread.interrupt();
	}
}
```

<br>
<br>

### 6. 스레드풀
- 병렬작업 처리가 많아지면 스레드 개수 증가 -> 스레드 생성 및 스케쥴링을 CPU가 바빠져서 메모리 많이 사용

- 결국 성능저하.

- **갑작스런 병렬 작업처리가 많아질 때 스레드풀을 이용.**

- 스레드를 제한된 개수만큼 정해놓고 작업큐(Queue)에 들어오는 작업들을 하나씩 스레드가 맡아서 처리.

- 스레드풀 생성/사용을 위해 Executors 클래스와 ExecutorService 인터페이스를 제공.

- Executors의 다양한 정적메소드로 ExecutorService의 구현객체를 만들 수 있는데 이것이 바로 스레드풀.

**(1) 스레드풀 생성**

Executors 클래스
- newCachedThreadPool()

- newFixedThreadPool()
```java
ExecutorService executorService = Executors.newCachedThreadPool();

ExecutorService executorService2 = Executors.newFixedThreadPool(
	Runtime.getRuntime().availableProcessors();
); //cpu의 코어수만큼 최대스레드풀 생성
```
**(2) 스레드풀 종료**
```java
executorService.shutdown() - 남아있는 작업을 마무리하고 스레드풀 종료
executorService.shutdownNow() - 남아있는 작업과는 상관없이 강제로 종료
```

**(2) 작업처리요청**
- ExecutorService의 작업큐에 Runnable 혹은 Callable객체를 넣는 행위
- 작업처리 요청을 위해 submit()과 execute() 메소드를 제공함.

- execute() : Runnable을 작업큐에 저장

- submit() : Runnable 또는 Callable을 작업큐에 저장, Future 객체를 리턴

- **submit 메소드를 사용하는 것이 스레드의 생성오버헤드를 줄이는데 좋다**. 왜냐하면 execute메소드는 작업처리중 예외가 발생하면 쓰던 스레드를 버리고 새로운 스레드를 생성한다. 하지만 submit 메소드는 쓰던 스레드를 재활용한다.
```java
public static void main(String[] args) throws Exception{
		ExecutorService executorService = Executors.newFixedThreadPool(2); //최대스레드 개수가 2인 스레드풀 생성
		
		for(int i =0; i<10; i++) {
			Runnable runnable = new Runnable() {

				@Override
				public void run() {
					ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) executorService;
					int poolSize = threadPoolExecutor.getPoolSize();
					String threadName = Thread.currentThread().getName();
					System.out.println("[총 스레드 개수 : "+poolSize+"] 작업 스레드 이름 :"+threadName);
					
					//예외 발생시킴
					int value = Integer.parseInt("삼");
				}
			};	
            //이 두개를 번갈아가면서 실행해보세요.
			//executorService.execute(runnable);
			executorService.submit(runnable);
			
			Thread.sleep(10);//콘솔 출력시간을 위해 0.01초 일시정지
		}
		executorService.shutdown();
	}
```


<br>
<br>


### 7. 데몬스레드 

- 데몬 스레드(deamon thread)란 다른 일반 스레드의 작업을 돕는 보조적인 역할을 하는 스레드를 가리킨다.
따라서 데몬 스레드는 일반 스레드가 모두 종료되면 더는 할 일이 없으므로, 데몬 스레드 역시 자동으로 종료된다.
데몬 스레드의 생성 방법과 실행 방법은 모두 일반 스레드와 같다.
단, 실행하기 전에 setDaemon() 메소드를 호출하여 데몬 스레드로 설정하기만 하면 된다.
이러한 데몬 스레드는 일정 시간마다 자동으로 수행되는 저장 및 화면 갱신 등에 이용되고 있다.

<br>
<br>
<hr>

## ✍ 6. Spring에 Thread 적용 

### 1. 방향성 
- 다중으로 task관리 
- pool 관리 
- exception 관리 

### 2. 흐름 
- AsyncConfigurer 사용, ThreadPoolTaskExecutor 활용하여 Executor를 다중으로 생성
- AsyncConfigurer 를 사용했기 때문에 ExceptionHandler 연결이 가능 
- @Async 를 활용해서 여러 Thread를 생성해 필요한 Executor 과 연결하여 사용한다.
- ThreadPoolTaskExecutor 를 사용한 이유는 가장 보편적이며 동시에 pool 관리를 할 수 있기 때문이다.

### 3. 시작 
(1) 먼저 클래스 생성해야됨 
```java
@Configuration				// @Configuration 를 활용하여 bean 객체 등록
@EnableAsync				// @EnableAsync
public class AsyncConfig implements AsyncConfigurer {	// AsyncConfigurer 를 상속받아서 AsyncConfig 구현
```

(2) Executor 에 사용할 변수들 상수화
```java
    /** 샘플 기본 Thread 수 */
    private static int TASK_SAMPLE_CORE_POOL_SIZE = 2;
    /** 샘플 최대 Thread 수 */
    private static int TASK_SAMPLE_MAX_POOL_SIZE = 5;
    /** 샘플 QUEUE 수 */
    private static int TASK_SAMPLE_QUEUE_CAPACITY = 0;
    /** 샘플 Thread Bean Name */
    private static String EXECUTOR_SAMPLE_BEAN_NAME = "executorSample";
    /** 샘플 Thread */
    @Resource(name = "executorSample")
    private ThreadPoolTaskExecutor executorSample;
```


(3) AsyncConfigurer 상속 받아 클래스를 만들면 @Override 해야하는 함수 2개 존재
- 1. getAsyncExecutor 
- 2. Executor 
```java
@Bean(name = "executorSample")			// Bean Name 추가
@Override
public Executor getAsyncExecutor() {
	ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
	executor.setCorePoolSize(TASK_SAMPLE_CORE_POOL_SIZE);	//pool size 지정
	executor.setMaxPoolSize(TASK_SAMPLE_MAX_POOL_SIZE);	//최대 pool size 지정
	executor.setQueueCapacity(TASK_SAMPLE_QUEUE_CAPACITY);	//queue size 지정
	executor.setBeanName(EXECUTOR_SAMPLE_BEAN_NAME);	// bean name 지정 
	executor.initialize();
	return executor;
}
```

(4) getAsyncUncaughtExceptionHandler 함수 : ExceptionHandler 연결하는 함수 
```java
  @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        // TODO Auto-generated method stub
        return null;
    }
```

(5) task를 생성하기 전에 pool이 모두 찼는지를 체크하는 함수(생략가능)
```java
    /**
     * 샘플 Thread 등록 가능 여부
     *
     * @return 실행중인 task 개수가 최대 개수(max + queue)보다 크거나 같으면 false
     */
    public boolean isSampleTaskExecute() {
        boolean rtn = true;
 
        System.out.println("EXECUTOR_SAMPLE.getActiveCount() : " + executorSample.getActiveCount());
 
        // 실행중인 task 개수가 최대 개수(max + queue)보다 크거나 같으면 false
        if (executorSample.getActiveCount() >= (TASK_SAMPLE_MAX_POOL_SIZE + TASK_SAMPLE_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * 샘플 Thread 등록 가능 여부
     *
     * @param createCnt : 생성 개수
     * @return 실행중인 task 개수 + 실행할 개수가 최대 개수(max + queue)보다 크면 false
     */
    public boolean isSampleTaskExecute(int createCnt) {
        boolean rtn = true;
 
        // 실행중인 task 개수 + 실행할 개수가 최대 개수(max + queue)보다 크거나 같으면 false
        if ((executorSample.getActiveCount() + createCnt) > (TASK_SAMPLE_MAX_POOL_SIZE + TASK_SAMPLE_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
```
<br>

 **다중 생성을 위해 하나 더 추가한 전체 코드**

 AsyncConfig.java
```java
import java.util.concurrent.Executor;
 
import javax.annotation.Resource;
 
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
 
@Configuration
@EnableAsync
public class AsyncConfig implements AsyncConfigurer {
    /** 샘플 기본 Thread 수 */
    private static int TASK_SAMPLE_CORE_POOL_SIZE = 2;
    /** 샘플 최대 Thread 수 */
    private static int TASK_SAMPLE_MAX_POOL_SIZE = 5;
    /** 샘플 QUEUE 수 */
    private static int TASK_SAMPLE_QUEUE_CAPACITY = 0;
    /** 샘플 Thread Bean Name */
    private static String EXECUTOR_SAMPLE_BEAN_NAME = "executorSample";
    /** 샘플 Thread */
    @Resource(name = "executorSample")
    private ThreadPoolTaskExecutor executorSample;
 
    /** 기타 기본 Thread 수 */
    private static int TASK_ETC_CORE_POOL_SIZE = 5;
    /** 기타 최대 Thread 수 */
    private static int TASK_ETC_MAX_POOL_SIZE = 10;
    /** 기타 QUEUE 수 */
    private static int TASK_ETC_QUEUE_CAPACITY = 0;
    /** 기타 Thread Bean Name */
    private static String EXECUTOR_ETC_BEAN_NAME = "executorEtc";
    /** 기타 Thread */
    @Resource(name = "executorEtc")
    private ThreadPoolTaskExecutor executorEtc;
 
    /**
     * 샘플 Thread 생성
     *
     * @return
     */
    @Bean(name = "executorSample")
    @Override
    public Executor getAsyncExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(TASK_SAMPLE_CORE_POOL_SIZE);
        executor.setMaxPoolSize(TASK_SAMPLE_MAX_POOL_SIZE);
        executor.setQueueCapacity(TASK_SAMPLE_QUEUE_CAPACITY);
        executor.setBeanName(EXECUTOR_SAMPLE_BEAN_NAME);
        executor.initialize();
        return executor;
    }
 
    /**
     * 샘플 Thread 등록 가능 여부
     *
     * @return 실행중인 task 개수가 최대 개수(max + queue)보다 크거나 같으면 false
     */
    public boolean isSampleTaskExecute() {
        boolean rtn = true;
 
        System.out.println("EXECUTOR_SAMPLE.getActiveCount() : " + executorSample.getActiveCount());
 
        // 실행중인 task 개수가 최대 개수(max + queue)보다 크거나 같으면 false
        if (executorSample.getActiveCount() >= (TASK_SAMPLE_MAX_POOL_SIZE + TASK_SAMPLE_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * 샘플 Thread 등록 가능 여부
     *
     * @param createCnt : 생성 개수
     * @return 실행중인 task 개수 + 실행할 개수가 최대 개수(max + queue)보다 크면 false
     */
    public boolean isSampleTaskExecute(int createCnt) {
        boolean rtn = true;
 
        // 실행중인 task 개수 + 실행할 개수가 최대 개수(max + queue)보다 크거나 같으면 false
        if ((executorSample.getActiveCount() + createCnt) > (TASK_SAMPLE_MAX_POOL_SIZE + TASK_SAMPLE_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * 기타 Thread 생성
     *
     * @return
     */
    @Bean(name = "executorEtc")
    @Qualifier
    public Executor taskExecutorEtc() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(TASK_ETC_CORE_POOL_SIZE);
        executor.setMaxPoolSize(TASK_ETC_MAX_POOL_SIZE);
        executor.setQueueCapacity(TASK_ETC_QUEUE_CAPACITY);
        executor.setBeanName(EXECUTOR_ETC_BEAN_NAME);
        executor.initialize();
        return executor;
    }
 
    /**
     * 기타 Thread 등록 가능 여부
     *
     * @return 실행중인 task 개수가 최대 개수(max + queue)보다 크거나 같으면 false
     */
    public boolean isEtcTaskExecute() {
        boolean rtn = true;
 
        // 실행중인 task 개수가 최대 개수(max + queue)보다 크거나 같으면 false
        if (executorEtc.getActiveCount() >= (TASK_ETC_MAX_POOL_SIZE + TASK_ETC_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * 기타 Thread 등록 가능 여부
     *
     * @param createCnt : 생성 개수
     * @return 실행중인 task 개수 + 실행할 개수가 최대 개수(max + queue)보다 크면 false
     */
    public boolean isEtcTaskExecute(int createCnt) {
        boolean rtn = true;
 
        // 실행중인 task 개수 + 실행할 개수가 최대 개수(max + queue)보다 크거나 같으면 false
        if ((executorEtc.getActiveCount() + createCnt) > (TASK_ETC_MAX_POOL_SIZE + TASK_ETC_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /* (non-Javadoc)
     * @see org.springframework.scheduling.annotation.AsyncConfigurer#getAsyncUncaughtExceptionHandler()
     */
    @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        return new AsyncExceptionHandler();
    }
}
```


(6) 생성된 Executor 인 executorSample 과 연결할 AsyncTask class 파일
```java
@Service("asyncTaskSample")
public class AsyncTaskSample {

}
```
(7) task 생성 
- 리턴타입은 void와 Future<String> 두 가지로 작성 가능
- @Async 사용시 제약사항
  - 1. 함수는 무조건 public 타입이어야 한다.
  - 2. 같은 클래스 안에서 셀프호출 안 됨. 
```java
    @Async("executorSample") 
	//@Async 를 사용해서 비동기 메소드라고 선언하고 연결할 Executor 명을 적어준다.

    public void executorSample(String str) {
        // LOG : 시작 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // 내용
        // 내용
        // 내용
        
        // LOG : 종료 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
 
    @Async("executorSample")
	//@Async 를 사용해서 비동기 메소드라고 선언하고 연결할 Executor 명을 적어준다.

    public void executorSample2(String str) {
        // LOG : 시작 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // 내용
        // 내용		비동기로 할 작업을 코딩하거나 함수를 호출하면 됨 
        // 내용
        
        // LOG : 종료 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
```

**전체 코드**

AsyncTaskSample.java
```java
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
 
/**
 * @Title      : AsyncTaskSample 관리
 * @Filename   : AsyncTaskSample.java
 */
@Service("asyncTaskSample")
public class AsyncTaskSample {
    
    /**
     * 시뮬레이션 테스트용 함수
     *
     * @param str
     */
    @Async("executorSample")
    public void executorSample(String str) {
        // LOG : 시작 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // 내용
        // 내용
        // 내용
        
        // LOG : 종료 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
    
    /**
     * 시뮬레이션 테스트용 함수2
     *
     * @param str
     */
    @Async("executorSample")
    public void executorSample2(String str) {
        // LOG : 시작 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // 내용
        // 내용
        // 내용
        
        // LOG : 종료 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
}
```

AsyncTaskEtc.java
```java
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
 
/**
 * @Title      : AsyncTaskEtc 관리
 * @Filename   : AsyncTaskEtc.java
 */
@Service("asyncTaskEtc")
public class AsyncTaskEtc {
    
    /**
     * 기타 스레드 테스트용 함수
     *
     * @param str
     */
    @Async("executorEtc")
    public void executorEtc(String str) {
        // LOG : 시작 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // 내용
        // 내용
        // 내용
        
        // LOG : 종료 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
    
    /**
     * 기타 스레드 테스트용 함수2
     *
     * @param str
     */
    @Async("executorEtc")
    public void executorEtc2(String str) {
        // LOG : 시작 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
 
        // 내용
        // 내용
        // 내용
        
        // LOG : 종료 입력
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
}
```
	
<br>
<br>
<hr>

## ✍ 7. 로그아웃 후 뒤로가기 방지  

### 1. 설정으로 해결
```java
<mvc:interceptor>
    <mvc:mapping path="/**/*" />
    <beans:bean id="webContentInterceptor" class="org.springframework.web.servlet.mvc.WebContentInterceptor">
	<beans:property name="cacheSeconds" value="0" />

          <beans:property name="useExpiresHeader" value="true" />
	<beans:property name="useCacheControlHeader" value="true" />
	<beans:property name="useCacheControlNoStore" value="true" />
    </beans:bean>
</mvc:interceptor>	
```
### 2. 스크립트로 막기
- script
```java
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
```
- body
```java
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">	
```
	
	<br>
<br>
<hr>

## ✍ 8. 특정 확장자 파일 
```java
										<c:when test="${empty update.programId || update.programId eq ''}">
											<div class="area_filebox">
												<input type="text" class="upload_name" disabled="disabled" title="첨부파일명이 표시됩니다.">
												<label for="menu_item09">파일찾기</label>
												<input type="file" class="upload_hidden" id="menu_item09" name="programImageFile" onchange="fileExtChange()" value="${update.programImage}" title="프로그램 이미지">
											</div>	
```

```java
	function fileExtChange() {
		var fileName = $("input[name=programImageFile]").val();
		var fileExt = fileName.split(".")[1];

		if(fileExt == "jpg" || fileExt == "png" || fileExt == "bmp" || fileExt == "gif" || fileExt == "tif" || fileExt == "JPG" || fileExt == "PNG" || fileExt == "BMP" || fileExt == "GIF" || fileExt == "TIF") {}
		else {
			$("input[name=programImageFile]").val("");
			$(".upload_name").val("");
			alert("이미지 확장자만 첨부 가능합니다.");
			return false;
		}
	}	
```

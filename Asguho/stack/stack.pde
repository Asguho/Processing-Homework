class Node<T> {
    T val;
    Node next;
    Node(T val, Node next) {
        this.val = val;
        this.next = next;
    }
}

class Stack<T> {
    Node<T> top;
    Stack() {
        top = null;
    }

    void push(T val) {
        Node<T> n = new Node<T>(val, top);
        top = n;
    }

    T pop() {
        T val = top.val;
        top = top.next;
        return val;
    }
}
class Queue<T> {
    Node<T> head;
    Node<T> tail;
    Queue() {
        head = null;
        tail = null;
    }

    void enqueue(T val) {
        Node<T> n = new Node<T>(val, null);
        if (head == null) {
            head = n;
            tail = n;
        } else {
            tail.next = n;
            tail = n;
        }
    }

    T dequeue() {
        T val = head.val;
        head = head.next;
        return val;
    }
}

void setup() {
    Stack<Integer> s = new Stack<Integer>();
    s.push(1);
    s.push(2);
    s.push(3);
    s.push(4);
    s.pop();
    println(s.pop());

    Queue<Integer> q = new Queue<Integer>();

    q.enqueue(1);
    q.enqueue(2);
    q.enqueue(3);
    q.enqueue(4);
    q.dequeue();
    println(q.dequeue());
}


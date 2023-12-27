#include "simple_linked_list.h"

#include <stdexcept>

namespace simple_linked_list {

std::size_t List::size() const {
    return this->current_size;
}

void List::push(int entry) {
    Element* temp = new Element(entry);
    temp->next = this->head;
    this->head = temp;
    this->current_size++;
}

int List::pop() {
    Element* temp = this->head;
    this->head = this->head->next;
    this->current_size--;
    return temp->data;
}

void List::reverse() {
    Element* prev = nullptr;
    Element* current = this->head;
    Element* next = nullptr;
    while (current != nullptr) {
        next = current->next;
        current->next = prev;
        prev = current;
        current = next; 
    }
    this->head = prev;
}

List::~List() {
    Element* temp = this->head;
    while (temp != nullptr) {
        Element* next = temp->next;
        delete temp;
        temp = next;
    }
}

}  // namespace simple_linked_list

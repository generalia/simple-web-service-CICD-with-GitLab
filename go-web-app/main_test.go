// main_test.go

package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func MyGoEndpoint(w http.ResponseWriter, r *http.Request) {
    w.WriteHeader(http.StatusOK)
    w.Write([]byte("Hello from Go Web App at /mygo!"))
}

func TestMyGoEndpoint(t *testing.T) {
	req, err := http.NewRequest("GET", "/mygo", nil)
	if err != nil {
		t.Fatal(err)
	}

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(MyGoEndpoint)

	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusOK {
		t.Errorf("Handler returned wrong status code: got %v want %v", status, http.StatusOK)
	}

	expected := "Hello from Go Web App at /mygo!"
	if rr.Body.String() != expected {
		t.Errorf("Handler returned unexpected body: got %v want %v", rr.Body.String(), expected)
	}
}
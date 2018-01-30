using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CubeControl : MonoBehaviour {

    public float rotationSpeed = 180f;
    public float moveSpeed = 20.0f;

    public GameObject bulletSpawnPoint;
    public GameObject bulletPrefab;

    private GameObject tankTarget;

    // Use this for initialization
    void Start () {
        tankTarget = GameObject.FindGameObjectWithTag("tankTarget");
    }
	
	// Update is called once per frame
	void Update () {

        //transform.LookAt(tankTarget.transform.position);
        //transform.Translate(0, 0, moveSpeed * Time.deltaTime);

        //transform.rotation = Quaternion.LookRotation(tankTarget.transform.position - transform.position);
        //transform.position = Vector3.Lerp(transform.position, tankTarget.transform.position, Time.deltaTime);

        if (Input.GetKey(KeyCode.Escape))
        {
            Application.Quit();
        }

        if (Input.GetKey(KeyCode.W))
        {
            transform.Translate(0, 0, moveSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.S))
        {
            transform.Translate(0, 0, - moveSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.A))
        {
            transform.Rotate(0, - rotationSpeed * Time.deltaTime, 0);
        }
        if (Input.GetKey(KeyCode.D))
        {
            transform.Rotate(0, rotationSpeed * Time.deltaTime, 0);
        }

        if (Input.GetKeyDown(KeyCode.Space))
        {
            GameObject bullet = GameObject.Instantiate<GameObject>(bulletPrefab);
            bullet.transform.position = bulletSpawnPoint.transform.position;
            bullet.transform.rotation = transform.rotation;

        }
    }
}

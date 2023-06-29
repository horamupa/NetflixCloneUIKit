//
//  APICaller.swift
//  NetflixCloneUIKit
//
//  Created by MM on 28.06.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "0d34563a97aa15685a26dac0dd401a37"
    static let baseURL = "https://api.themoviedb.org"
}

struct APICallerError: Error {
    
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                // Это что такое? чем отличается от декодера?
                let result = try JSONDecoder().decode(TrandingTitlesResponse.self, from: data)
                completion(.success(result.results))
                print("1 ok")
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                // Это что такое? чем отличается от декодера?
                let result = try JSONDecoder().decode(TrandingTitlesResponse.self, from: data)
                completion(.success(result.results))
                print("1 ok")
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                // Это что такое? чем отличается от декодера?
                let result = try JSONDecoder().decode(TrandingTitlesResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                // Это что такое? чем отличается от декодера?
                let result = try JSONDecoder().decode(TrandingTitlesResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                // Это что такое? чем отличается от декодера?
                let result = try JSONDecoder().decode(TrandingTitlesResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    
    
}
